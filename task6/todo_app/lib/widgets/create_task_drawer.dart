import 'dart:core';

import 'package:flutter/material.dart';
import 'package:todo_app/common/app_colors.dart';

import '../model/task.dart';

class CreateTaskDrawer extends StatefulWidget {
  final ValueChanged<Task> onAdd;

  const CreateTaskDrawer(this.onAdd, {Key? key}) : super(key: key);

  @override
  State<CreateTaskDrawer> createState() => _CreateTaskDrawerState();
}

class _CreateTaskDrawerState extends State<CreateTaskDrawer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBackground,
      body: Form(
        key: _formKey,
        child: SafeArea(
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
      ),
    );
  }

  String? _validateTitle(String? value) {
    if (value!.isEmpty) {
      return 'Title is required';
    }

    return null;
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onAdd(Task(title: _controller.text, isDone: false));
      Navigator.pop(context);
    }
  }
}
