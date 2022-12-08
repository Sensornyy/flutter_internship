import 'package:flutter/material.dart';
import 'package:todo_app/common/app_colors.dart';

import '../model/task.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(this._task, {Key? key}) : super(key: key);

  final Task _task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    var cardColor = AppColors.cardBackground;

    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          cardColor = const Color.fromRGBO(38, 71, 71, 1);
        });
      },
      child: Stack(
        children: <Widget>[
          Container(
              width: 380,
              height: 100,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: cardColor),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 20),
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
                    ],
                  ),
                ],
              )),
          const Padding(
            padding: EdgeInsets.only(
              left: 345,
              top: 40,
            ),
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
