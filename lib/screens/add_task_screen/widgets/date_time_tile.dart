import 'package:flutter/material.dart';
import '../../../constants/colors.dart';


class DateTimeTile extends StatelessWidget {
  final String value;
  final VoidCallback onTap;
  final IconData icon;
  const DateTimeTile({super.key, required this.value, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(child: Text(value, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.white, fontSize: 15),)),
            const SizedBox(width: 6,),
            Icon(icon, size: 18, color: AppColors.secondaryColor,)
          ],),
      ),
    ));
  }
}
