import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../model/status.dart';
import '../model/task.dart';

class TaskStatusView extends StatelessWidget {
  const TaskStatusView(this._task, {Key? key}) : super(key: key);

  final Task _task;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 10,
              width: 50,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: AppColors.cardBackground,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: switchCaseForWidthFactor(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Text(switchCaseForText(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

extension _TaskStatusSwitchCaseMethods on TaskStatusView {
  double switchCaseForWidthFactor() {
    switch (_task.status) {
      case Status.ready:
        return 0.3;
      case Status.inProgress:
        return 0.5;
      default:
        return 1;
    }
  }

  String switchCaseForText() {
    switch (_task.status) {
      case Status.ready:
        return 'Ready';
      case Status.inProgress:
        return 'In progress';
      default:
        return 'Done';
    }
  }
}
