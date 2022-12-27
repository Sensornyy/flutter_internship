import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/common/app_colors.dart';

import '../bloc/task_cubit.dart';
import '../bloc/task_state.dart';
import '../model/task.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    required this.task,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<TasksCubit>().state;

    return Dismissible(
      key: Key(task.id),
      onDismissed: (_) {
        context.read<TasksCubit>().deleteTask(task);
      },
      child: GestureDetector(
        onLongPress: () {
          state is TasksEditingState
              ? context.read<TasksCubit>().toggleTask(task)
              : context.read<TasksCubit>().editTask(task);
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: 380,
              height: 100,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: task.isDone
                    ? AppColors.doneTaskCardColor
                    : AppColors.cardBackground,
              ),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 20),
                  state is TasksEditingState
                      ? Checkbox(
                          value: task.isDone,
                          onChanged: (_) {
                            context.read<TasksCubit>().toggleTask(task);
                          })
                      : const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 48,
                        ),
                  const SizedBox(width: 10),
                  const VerticalDivider(
                      color: Colors.grey, indent: 12, endIndent: 12),
                  const SizedBox(width: 10),
                  Text(task.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
