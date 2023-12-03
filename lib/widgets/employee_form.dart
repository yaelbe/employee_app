import 'package:flutter/material.dart';
import '../models/employee.dart';

class EmployeeForm extends StatefulWidget {
  final Employee? employee;
  final Function(Employee) onSave;

  EmployeeForm({this.employee, required this.onSave});

  @override
  _EmployeeFormState createState() => _EmployeeFormState();
}

class _EmployeeFormState extends State<EmployeeForm> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _position;

  @override
  void initState() {
    super.initState();
    if (widget.employee != null) {
      _name = widget.employee!.name;
      _position = widget.employee!.position;
    } else {
      _name = '';
      _position = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            initialValue: _name,
            decoration: InputDecoration(labelText: 'Name'),
            onSaved: (value) => _name = value ?? '',
            validator: (value) => value != null && value.isNotEmpty ? null : 'Name is required',
          ),
          TextFormField(
            initialValue: _position,
            decoration: InputDecoration(labelText: 'Position'),
            onSaved: (value) => _position = value ?? '',
            validator: (value) => value != null && value.isNotEmpty ? null : 'Position is required',
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onSave(Employee(id: widget.employee?.id ?? '', name: _name, position: _position));
              }
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
