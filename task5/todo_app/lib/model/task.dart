import 'package:flutter/material.dart';
import 'package:todo_app/model/status.dart';

class Task {
  final String id;
  String title;
  Icon icon;
  String status;

  Task({
    required this.id,
    required this.title,
    required this.icon,
    required this.status,
  });
}
