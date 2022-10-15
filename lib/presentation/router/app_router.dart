import 'package:active_box/presentation/screens/home_screen.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
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
      case AppRouterNames.rLoginRoute:

      default:
        return null;
    }
  }
}
