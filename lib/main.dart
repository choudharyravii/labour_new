import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:labour_dekho/core/config/common_shared_preference.dart';
import 'package:labour_dekho/core/config/shared_preferences_constants.dart';
import 'package:labour_dekho/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: "assets/translations",
      supportedLocales: const [
        Locale('en', 'UK'),
        Locale('hi', 'IN'),
      ],
      useFallbackTranslations: true,
      saveLocale: false,
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    setLocalization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'Labour Dekho',
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.purple,
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
            textTheme: const TextTheme(
              displayLarge: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
              ),
              titleLarge: TextStyle(
                fontSize: 20,
              ),
            )),
        home:  const LoginScreen(),
      ),
    );
  }

  setLocalization() async {
    String lang = await CommonSharedPreference.getPreferences(SharedPreferencesConstants.lang);
    if( lang == 'null') {
      lang = 'en';
    }
    if (lang == 'en') {
      await CommonSharedPreference.setPreferences(SharedPreferencesConstants.lang, 'en');
      context.setLocale(const Locale('en', 'UK'));
    } else if (lang == 'hi') {
      await CommonSharedPreference.setPreferences(SharedPreferencesConstants.lang, 'hi');
      context.setLocale(const Locale('hi', 'IN'));
    }
  }
}
