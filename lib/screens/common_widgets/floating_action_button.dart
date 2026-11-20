import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../add_task_screen/add_task_screen.dart';


class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddTaskScreen()),
        );
      },
      backgroundColor: AppColors.secondaryColor,
      child: const Icon(Icons.add, color: Colors.white, size: 32),
    );
  }
}