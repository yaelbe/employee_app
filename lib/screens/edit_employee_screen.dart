import 'package:flutter/material.dart';
import '../models/employee.dart';
import '../widgets/employee_form.dart';

class EditEmployeeScreen extends StatelessWidget {
  final Employee employee;
  void Function(Employee) editEmployee;

  EditEmployeeScreen( this.employee,  this.editEmployee, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Employee')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: EmployeeForm(
          employee: employee,
          onSave: (updatedEmployee) {
            editEmployee(updatedEmployee);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
