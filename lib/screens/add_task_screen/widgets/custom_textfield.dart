import 'package:flutter/material.dart';
import '../../../constants/colors.dart';


class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final int maxLines;
  const CustomTextField({
    super.key,
    required this.controller, required this.hintText, this.maxLines = 1,  this.keyboardType = TextInputType.text,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      cursorColor: Colors.white,
      keyboardType: maxLines > 1 ? TextInputType.multiline : keyboardType,
      textCapitalization: textCapitalization,
      textInputAction: maxLines > 1 ? TextInputAction.newline : TextInputAction.next,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white38),
          fillColor: AppColors.cardColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(12),
          )
      ),
    );
  }
}