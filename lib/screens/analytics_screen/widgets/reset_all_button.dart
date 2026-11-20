import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/colors.dart';
import '../../../providers/task_notifier_provider.dart';

class ResetAllButton extends ConsumerWidget{
  const ResetAllButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (dialogContext) => AlertDialog(
              backgroundColor: AppColors.barColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: const Text(
                'Reset all tasks?',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              content: const Text(
                'This will permanently delete every task. This action cannot be undone.',
                style: TextStyle(color: Colors.white70),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(dialogContext),
                  child: const Text('Cancel', style: TextStyle(color: Colors.white70)),
                ),
                TextButton(
                  onPressed: () {
                    ref.read(taskNotifierProvider.notifier).resetAll();
                    Navigator.pop(dialogContext);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.redAccent,
                        content: Text('All tasks deleted'),
                      ),
                    );
                  },
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        icon: const Icon(Icons.delete_forever_rounded),
        label: const Text('Reset All', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      ),
    );
  }
}