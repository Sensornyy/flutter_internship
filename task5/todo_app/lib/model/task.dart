import 'package:flutter/material.dart';
import 'package:todo_app/model/status.dart';

class Task {
  final int id;
  String title;
  Icon icon;
  Status status;

  Task({
    required this.id,
    required this.title,
    required this.icon,
    required this.status,
  });
}
