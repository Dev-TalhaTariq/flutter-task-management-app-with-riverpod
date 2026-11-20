import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class ColorGuide extends StatelessWidget {
  const ColorGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ColorGuideCircle(color: AppColors.secondaryColor, label: 'Completed'),
        SizedBox(width: 16),
        _ColorGuideCircle(color: AppColors.pendingColor, label: 'Pending'),
        SizedBox(width: 16),
        _ColorGuideCircle(color: AppColors.expiredColor, label: 'Expired'),
      ],
    );
  }
}

class _ColorGuideCircle extends StatelessWidget {
  final Color color;
  final String label;
  const _ColorGuideCircle({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
      ],
    );
  }
}