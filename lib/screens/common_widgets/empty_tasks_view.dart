import 'package:flutter/material.dart';

class NoTasksFound extends StatelessWidget {
  const NoTasksFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Icon(
            Icons.assignment_late_outlined,
            size: 60,
            color: Colors.white30,
          ),
          SizedBox(height: 8),
          Text(
            'No tasks found',
            style: TextStyle(color: Colors.white60, fontSize: 16),
          ),
        ],
      ),
    );
  }
}