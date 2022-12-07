import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/common/app_colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Container(
              width: 380,
              height: 100,
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.cardBackground),
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
                      Text('lesson.name,',
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
