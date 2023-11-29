import 'package:flutter/material.dart';
import 'package:pegawai/model/employee.dart';
import 'dart:async';
import 'package:pegawai/database/dbhelper.dart';

class MyEmployeeList extends StatefulWidget {
  @override
  MyEmployeeListPageState createState() => MyEmployeeListPageState();
}

class MyEmployeeListPageState extends State<MyEmployeeList> {
  late DBHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  Future<List<Employee>> fetchEmployeesFromDatabase() async {
    return dbHelper.getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: FutureBuilder<List<Employee>>(
          future: fetchEmployeesFromDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text("No employees found."));
            } else {
              return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No. ${snapshot.data![index].id}. ${snapshot.data![index].firstName} ${snapshot.data![index].lastName}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _editEmployee(snapshot.data![index]);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteEmployee(snapshot.data![index]);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'Mobile No: ${snapshot.data![index].mobileNo}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            );

            }
          },
        ),
      ),
    );
  }

  void _editEmployee(Employee employee) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEmployeeScreen(
          employee: employee,
          onEmployeeUpdated: _updateEmployeeList,
        ),
      ),
    );
  }

  void _deleteEmployee(Employee employee) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this employee?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await dbHelper.deleteEmployee(employee.id!);
                Navigator.pop(context);
                _updateEmployeeList(); // Call the refresh function after deletion
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void _updateEmployeeList() {
    setState(() {});
  }
}

class EditEmployeeScreen extends StatefulWidget {
  final Employee employee;
  final Function() onEmployeeUpdated;

  EditEmployeeScreen({required this.employee, required this.onEmployeeUpdated});

  @override
  _EditEmployeeScreenState createState() => _EditEmployeeScreenState();
}

class _EditEmployeeScreenState extends State<EditEmployeeScreen> {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController mobileNoController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: widget.employee.firstName);
    lastNameController = TextEditingController(text: widget.employee.lastName);
    mobileNoController = TextEditingController(text: widget.employee.mobileNo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: mobileNoController,
              decoration: InputDecoration(labelText: 'Mobile No'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _updateEmployee();
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateEmployee() async {
    Employee updatedEmployee = Employee(
      id: widget.employee.id,
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      mobileNo: mobileNoController.text,
    );

    await DBHelper().updateEmployee(updatedEmployee);
    widget.onEmployeeUpdated(); // Call the callback
    Navigator.pop(context);
  }
}
