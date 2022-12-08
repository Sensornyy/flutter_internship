import 'dart:core';

import 'package:flutter/material.dart';
import 'package:todo_app/common/app_colors.dart';
import 'package:todo_app/common/get_random_icon.dart';

class CreateTaskDrawer extends StatefulWidget {
  const CreateTaskDrawer(this.addNewTask, {Key? key}) : super(key: key);

  final Function addNewTask;

  @override
  State<CreateTaskDrawer> createState() => _CreateTaskDrawerState();
}

class _CreateTaskDrawerState extends State<CreateTaskDrawer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  final List<String> _statuses = ['Ready', 'In progress', 'Done'];
  String? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _controller,
                validator: _validateTitle,
                style: const TextStyle(color: Colors.amber),
                decoration: const InputDecoration(
                  hintText: 'Task title...',
                  hintStyle: TextStyle(color: Colors.amber),
                ),
              ),
            ),
            const SizedBox(height: 30),
            DropdownButtonFormField(
              dropdownColor: AppColors.mainBackground,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Task status...',
                  hintStyle: TextStyle(color: Colors.amber)),
              style: const TextStyle(color: Colors.amber),
              items: _getItems(),
              onChanged: _onChanged,
              value: _selectedStatus,
              validator: _validateStatus,
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                onPrimary: AppColors.cardBackground,
              ),
              onPressed: _submitForm,
              child: const SizedBox(
                width: 150,
                child: Text(
                  'SAVE TASK',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? _validateTitle(String? value) {
    if (value!.isEmpty) {
      return 'Title is required';
    }

    return null;
  }

  String? _validateStatus(String? sts) {
    if (sts == null) {
      return 'Status is required';
    }

    return null;
  }

  List<DropdownMenuItem<String>> _getItems() {
    return _statuses.map((sts) {
      return DropdownMenuItem(value: sts, child: Text(sts));
    }).toList();
  }

  void _onChanged(String? sts) {
    setState(() {
      _selectedStatus = sts;
    });
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.addNewTask(
        _controller.text,
        getRandomIcon(),
        _selectedStatus,
      );
      Navigator.pop(context);
    }
  }
}
