import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../common_widgets/section_heading.dart';

class StatusCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final int quantity;
  final IconData icon;
  final Color iconColor;

  const StatusCard({
    super.key,
    required this.title,
    required this.quantity,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 125,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 18, color: iconColor),
            ),
            const SizedBox(height: 10),
            SectionHeading(text: '$quantity', fontSize: 22),
            const SizedBox(height: 4),
            Text(title, style: const TextStyle(color: Colors.white70, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
