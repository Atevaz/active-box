import 'package:active_box/presentation/screens/add_note_screen.dart';
import 'package:active_box/presentation/screens/confirm_password_screen.dart';
import 'package:active_box/presentation/screens/home_screen.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/screens/create_new_password_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rOnBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => const Directionality(
            textDirection: TextDirection.rtl,
            child: HomeScreen(),
          ),
        );
      case AppRouterNames.rAddNoteRoute:
        return MaterialPageRoute(
          builder: (_) =>  Directionality(
            textDirection: TextDirection.rtl,
            child: AddNoteScreen(),
          ),
        );
      case AppRouterNames.rCreatePasswordRoute:
        return MaterialPageRoute(
          builder: (_) =>  Directionality(
            textDirection: TextDirection.rtl,
            child: CreateNewPasswordScreen(),
          ),
        );
      case AppRouterNames.rConfirmPasswordRoute:
        final String password=settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) =>  Directionality(
            textDirection: TextDirection.rtl,
            child: ConfirmPasswordScreen(password: password),
          ),
        );

      default:
        return null;
    }
  }
}
