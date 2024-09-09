import 'package:flutter/material.dart';
import 'package:mvvm_provider/utlis/routes/routes_name.dart';
import 'package:mvvm_provider/view/home_screen.dart';
import 'package:mvvm_provider/view/login_screen.dart';
import 'package:mvvm_provider/view/signUp_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeScreen(),
        );
      case RoutesName.loign:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen(),
        );
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignupScreen(),
        );
      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Scaffold(
            body: Center(
              child: Text(
                "No Routes is Found",
              ),
            ),
          );
        });
    }
  }
}
