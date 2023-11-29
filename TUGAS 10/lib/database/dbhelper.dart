import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pegawai/model/employee.dart';

class DBHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final String path = join(documentsDirectory.path, "employee.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE Employee(_id INTEGER PRIMARY KEY AUTOINCREMENT, firstname TEXT NOT NULL, lastname TEXT NOT NULL, mobileno TEXT NOT NULL)");
    print("Created tables");
  }

  Future<void> saveEmployee(Employee employee) async {
    var dbClient = await db;

    try {
      await dbClient.transaction((txn) async {
        return await txn.rawInsert(
          'INSERT INTO Employee(firstname, lastname, mobileno) VALUES(?, ?, ?)',
          [employee.firstName, employee.lastName, employee.mobileNo],
        );
      });
    } catch (e) {
      print("Error inserting employee: $e");
      // Atau cara lain menangani kesalahan, misalnya, lempar kembali error atau tampilkan pesan kesalahan ke pengguna.
    }
  }

  Future<List<Employee>> getEmployees() async {
    var dbClient = await db;

    final list = await dbClient.rawQuery('SELECT * FROM Employee');

    return list.map((json) => Employee.fromMap(json)).toList();
  }

  Future<void> updateEmployee(Employee employee) async {
    var dbClient = await db;

    try {
      await dbClient.transaction((txn) async {
        await txn.rawUpdate(
          'UPDATE Employee SET firstname = ?, lastname = ?, mobileno = ? WHERE _id = ?',
          [employee.firstName, employee.lastName, employee.mobileNo, employee.id],
        );
      });
    } catch (e) {
      print("Error updating employee: $e");
      // Atau cara lain menangani kesalahan
    }
  }

  Future<void> deleteEmployee(int id) async {
    var dbClient = await db;

    try {
      await dbClient.transaction((txn) async {
        await txn.rawDelete('DELETE FROM Employee WHERE _id = ?', [id]);
      });
    } catch (e) {
      print("Error deleting employee: $e");
      // Atau cara lain menangani kesalahan
    }
  }
  
  Future<void> close() async {
    var dbClient = await db;
    dbClient.close();
  }
}