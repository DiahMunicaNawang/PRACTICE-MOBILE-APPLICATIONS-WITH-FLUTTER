class Employee {
  int? id;
  final String firstName;
  final String lastName;
  final String mobileNo;

  Employee({
    this.id,
    required this.firstName, 
    required this.lastName, 
    required this.mobileNo,
  });
  
  set setId(int? value) {
    id = value;
  }

  static Employee fromMap(Map<String, Object?> map) => Employee(
    id: map["_id"] as int?,
    firstName: map["firstname"] as String,
    lastName: map["lastname"] as String,
    mobileNo: map["mobileno"] as String,
  );
}
