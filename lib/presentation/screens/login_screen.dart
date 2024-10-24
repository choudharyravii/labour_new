import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:labour_dekho/core/config/common_shared_preference.dart';
import 'package:labour_dekho/core/config/shared_preferences_constants.dart';
import 'package:labour_dekho/core/config/themes/app_colors.dart';
import 'package:labour_dekho/core/utils/common_prompts/size_config.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? currentLanguage;
  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  @override
  void initState() {
    apiCall();
    _btnController1.stateStream.listen((value) {
      if (kDebugMode) {
        print(value);
      }
    });
    super.initState();
  }

  apiCall() async {
    String lang = await CommonSharedPreference.getPreferences(SharedPreferencesConstants.lang);
    if(lang == 'en') {
      currentLanguage = 'en';
    } else {
      currentLanguage = 'hi';
    }
  }

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(const Duration(seconds: 10), () {
      controller.success();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenBody(context),
    );
  }

  screenBody(context) {
    return Container(
      color: AppColors.baseContainerColor,
      width: SizeConfig.displayWidth(context) * 1.0,
      height: SizeConfig.displayHeight(context) * 1.0,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            headerPart(context),
            SizedBox(height: SizeConfig.displayHeight(context) * 0.05),
            textField(context),
            SizedBox(height: SizeConfig.displayHeight(context) * 0.3),
            loginButton(context),
            SizedBox(height: SizeConfig.displayHeight(context) * 0.1),
          ],
        ),
      ),
    );
  }

  headerPart(context) {
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
                  onTap: () {
                    changeLanguage('en');
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                      ),
                      color: currentLanguage == 'hi' ? Colors.white :  Colors.green,
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '  English',
                        style: TextStyle(color: currentLanguage == 'hi' ? Colors.black :   AppColors.textColor),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    changeLanguage('hi');
                  },
                  child: Container(
                    decoration:  BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      color:  currentLanguage == 'hi'  ? Colors.green  : Colors.white,
                    ),
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ' हिंदी   ',
                        style: TextStyle(color: currentLanguage == 'hi'  ? AppColors.textColor  : Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
            'login'.tr(),
            style: const TextStyle(
                fontSize: 30,
                color: AppColors.textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  textField(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.displayWidth(context) * 0.07),
      child: TextFormField(
        style: const TextStyle(
          color: AppColors.textfieldTextColor,
        ),
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.call),
          hintText: 'phoneNumber'.tr(),
          hintStyle: const TextStyle(color: AppColors.hintTextColors),
          border: boxBorder,
          focusedBorder: boxBorder,
          disabledBorder: boxBorder,
          enabledBorder: boxBorder,
        ),
        cursorColor: AppColors.cursurColor,
      ),
    );
  }

  loginButton(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.displayWidth(context) * 0.07),
      child: SizedBox(
        width: double.infinity,
        child: RoundedLoadingButton(
          successIcon: Icons.cloud,
          failedIcon: Icons.cottage,
          color: AppColors.buttonColor,
          controller: _btnController1,
          onPressed: () => _doSomething(_btnController1),
          child: Text(
            'login'.tr(),
            style: const TextStyle(color: AppColors.textColor),
          ),
        ),
      ),
    );
  }

  static OutlineInputBorder boxBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: AppColors.borderColor, width: 2),
  );

  changeLanguage(lang) {
    if (lang == 'en') {
      context.setLocale(const Locale('en', 'UK'));
    } else if (lang == 'hi') {
      context.setLocale(const Locale('hi', 'IN'));
    }
    setState(() {
      currentLanguage = lang;
    });
  }
}
