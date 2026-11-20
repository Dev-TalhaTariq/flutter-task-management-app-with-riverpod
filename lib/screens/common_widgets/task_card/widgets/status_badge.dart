import 'package:flutter/material.dart';

class ExpiredBadge extends StatelessWidget {
  const ExpiredBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.redAccent.withValues(alpha: 0.3),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(4),
            topRight: Radius.circular(16),
          ),
        ),
        child: const Text(
          'Expired',
          style: TextStyle(color: Colors.redAccent, fontSize: 12),
        ),
      ),
    );
  }
}
