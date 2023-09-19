import 'package:flutter/material.dart';
import 'package:labour_dekho/core/config/themes/app_colors.dart';
import 'package:labour_dekho/core/utils/common_prompts/size_config.dart';

class AppBarHeader extends StatelessWidget {
  final String text;
  final bool? backIcon;
  final bool? chooseLanguageVisible;
  final String? currentLanguage;
  final void Function()? changeLanguageFunction;

  const AppBarHeader({
    super.key,
    required this.text,
    required this.changeLanguageFunction,
    this.backIcon,
    this.chooseLanguageVisible,
    this.currentLanguage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.displayHeight(context) * 0.4,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.appBarBg1, AppColors.appBarBg2],
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90))),
        ),
        backIcon!
            ? Positioned(
                top: SizeConfig.displayHeight(context) * 0.05,
                left: SizeConfig.displayWidth(context) * 0.05,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              )
            : SizedBox(),
        chooseLanguageVisible != false && chooseLanguageVisible != null ?
        Positioned(
          top: SizeConfig.displayHeight(context) * 0.05,
          right: SizeConfig.displayWidth(context) * 0.05,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: changeLanguageFunction,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      color:
                          currentLanguage == 'hi' ? Colors.white : Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '  English',
                        style: TextStyle(
                            color: currentLanguage == 'hi'
                                ? Colors.black
                                : AppColors.textColor),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: changeLanguageFunction,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color:
                          currentLanguage == 'hi' ? Colors.green : Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ' हिंदी   ',
                        style: TextStyle(
                            color: currentLanguage == 'hi'
                                ? AppColors.textColor
                                : Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ) : SizedBox(),
        Positioned(
          top: SizeConfig.displayHeight(context) * 0.15,
          left: SizeConfig.displayWidth(context) * 0.4,
          child: const Icon(
            Icons.logo_dev,
            size: 80,
          ),
        ),
        Positioned(
          bottom: SizeConfig.displayHeight(context) * 0.04,
          right: SizeConfig.displayWidth(context) * 0.1,
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 30,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
