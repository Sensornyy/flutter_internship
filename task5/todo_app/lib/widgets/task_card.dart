import 'package:flutter/material.dart';
import 'package:todo_app/common/app_colors.dart';
import 'package:todo_app/widgets/task_status_view.dart';

import '../model/status.dart';
import '../model/task.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(this._task, {Key? key}) : super(key: key);

  final Task _task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  var _isTaskDone = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          _isTaskDone = true;
          widget._task.status = Status.done;
        });
      },
      child: Stack(
        children: <Widget>[
          Container(
            width: 380,
            height: 100,
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: _isTaskDone || widget._task.status == Status.done
                  ? AppColors.doneTaskCardColor
                  : AppColors.cardBackground,
            ),
            child: Row(
              children: <Widget>[
                const SizedBox(width: 20),
                widget._task.icon,
                const SizedBox(width: 10),
                const VerticalDivider(
                    color: Colors.grey, indent: 12, endIndent: 12),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget._task.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                    const SizedBox(height: 5),
                    TaskStatusView(widget._task)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
