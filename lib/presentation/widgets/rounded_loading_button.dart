import 'package:flutter/material.dart';
import 'package:labour_dekho/core/config/themes/app_colors.dart';
import 'package:labour_dekho/core/utils/common_prompts/size_config.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class RoundedLoadingBtn extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final RoundedLoadingButtonController btnController;
  const RoundedLoadingBtn({super.key, required this.btnController, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      height: SizeConfig.displayHeight(context) * 0.08,
      successIcon: Icons.cloud,
      failedIcon: Icons.cottage,
      color: AppColors.buttonColor,
      controller: btnController,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: AppColors.textColor),
      ),
    );
  }
}
