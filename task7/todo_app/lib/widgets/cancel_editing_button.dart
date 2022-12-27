import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/common/app_colors.dart';

import '../bloc/task_cubit.dart';

class CancelEditingButton extends StatelessWidget {
  const CancelEditingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<TasksCubit>().cancelEditingTask();
      },
      backgroundColor: AppColors.cardBackground,
      child: const Icon(
        Icons.close,
        color: Colors.white,
      ),
    );
  }
}
