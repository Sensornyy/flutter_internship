import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/lesson/lesson.dart';

class LessonRepository {
  static Future<List<Lesson>> getLessonsList() async {
    final obj = await rootBundle.loadString("assets/json/source.json");

    final lessons = json.decode(obj);
    print(lessons);
    return (lessons as List).map((lesson) => Lesson.fromJson(lesson)).toList();
  }
}
