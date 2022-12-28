import 'package:flutter/material.dart';

class TaskError extends StatelessWidget {
  const TaskError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Ooops.. something went wrong',
      ),
    );
  }
}
