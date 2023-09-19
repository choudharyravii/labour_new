import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:labour_dekho/core/config/common_shared_preference.dart';
import 'package:labour_dekho/core/config/shared_preferences_constants.dart';
import 'package:labour_dekho/core/config/themes/app_colors.dart';
import 'package:labour_dekho/core/utils/common_prompts/size_config.dart';
import 'package:labour_dekho/core/utils/constants/routes_string.dart';
import 'package:labour_dekho/presentation/widgets/app_bar_header.dart';
import 'package:labour_dekho/presentation/widgets/rounded_loading_button.dart';
import 'package:labour_dekho/presentation/widgets/text_field_widget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? currentLanguage;
  TextEditingController phoneNoController = TextEditingController();
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
    String lang = await CommonSharedPreference.getPreferences(
        SharedPreferencesConstants.lang);
    if (lang == 'en') {
      currentLanguage = 'en';
    } else {
      currentLanguage = 'hi';
    }
  }

  void _doSomething(RoundedLoadingButtonController controller) async {
    Timer(const Duration(seconds: 3), () {
      controller.reset();
      Navigator.pushNamed(context, RoutesString.verificationOtpRoute);
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
    return AppBarHeader(
      text: 'login'.tr(),
      backIcon: false,
      chooseLanguageVisible: true,
      changeLanguageFunction: () {
        changeLanguage(currentLanguage == 'en' ? 'hi' : 'en');
      },
      currentLanguage: currentLanguage,
    );
  }

  textField(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.displayWidth(context) * 0.07),
      child: TextFieldWidget(
        hintText: 'phoneNumber'.tr(),
        controller: phoneNoController,
      ),
    );
  }

  loginButton(context) {
    return SizedBox(
      width: double.infinity,
      child: RoundedLoadingBtn(
        btnController: _btnController1,
        onPressed: () => _doSomething(_btnController1),
        text: 'login'.tr(),
      ),
    );
  }

  changeLanguage(lang) async {
    if (lang == 'en') {
      context.setLocale(const Locale('en', 'UK'));
      await CommonSharedPreference.setPreferences(SharedPreferencesConstants.lang, 'en');
    } else if (lang == 'hi') {
      context.setLocale(const Locale('hi', 'IN'));
      await CommonSharedPreference.setPreferences(SharedPreferencesConstants.lang, 'hi');
    }
    setState(() {
      currentLanguage = lang;
    });
  }
}
