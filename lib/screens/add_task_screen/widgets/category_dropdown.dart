import 'package:flutter/material.dart';
import 'package:task_management_app/models/task_model.dart';
import '../../../constants/colors.dart';

class CategoryDropdown extends StatelessWidget {
  final TaskCategory category;
  final ValueChanged<TaskCategory> onChanged;

  const CategoryDropdown({
    super.key,
    required this.category,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<TaskCategory>(
          iconEnabledColor: Colors.white70,
          value: category,
          dropdownColor: AppColors.cardColor,
          isExpanded: true,
          borderRadius: BorderRadius.circular(12),
          items: TaskCategory.values.map((c) {
            return DropdownMenuItem<TaskCategory>(
              value: c,
              child: Row(
                children: [
                  Icon(
                    c.icon,
                    color: AppColors.secondaryColor,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(c.label, style: const TextStyle(color: Colors.white)),
                ],
              ),
            );
          }).toList(),
          onChanged: (value){
            if (value != null) onChanged(value);
          }
        ),
      ),
    );
  }
}
