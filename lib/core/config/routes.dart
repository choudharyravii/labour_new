import 'package:flutter/material.dart';
import 'package:labour_dekho/core/utils/constants/routes_string.dart';
import 'package:labour_dekho/presentation/screens/login_screen.dart';
import 'package:labour_dekho/presentation/screens/verification_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesString.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RoutesString.verificationOtpRoute:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
