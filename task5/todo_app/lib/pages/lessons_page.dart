import 'package:flutter/material.dart';
import 'package:todo_app/repository/lesson_repository.dart';
import 'package:todo_app/widgets/lesson_card.dart';

import '../model/lesson/lesson.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: LessonRepository.getLessonsList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final List<Lesson> lessons = snapshot.data! as List<Lesson>;
              return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemBuilder: (context, index) {
                  return LessonCard(lesson: lessons[index]);
                },
                itemCount: lessons.length,
              );
            }
          }

          return const CircularProgressIndicator();
        });
  }
}
