import 'package:flutter/material.dart';
import 'package:labour_dekho/core/config/themes/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;

  const TextFieldWidget({
    super.key,
    this.hintText,
    this.controller,
  });

  static OutlineInputBorder boxBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: AppColors.borderColor, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.cursurColor,
      style: const TextStyle(
        color: AppColors.textfieldTextColor,
      ),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.call),
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.hintTextColors),
        border: boxBorder,
        focusedBorder: boxBorder,
        disabledBorder: boxBorder,
        enabledBorder: boxBorder,
      ),
    );
  }
}
