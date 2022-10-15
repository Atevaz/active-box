import 'package:active_box/presentation/screens/box_details.dart';
import 'package:active_box/presentation/screens/search_screen.dart';
import 'package:active_box/presentation/screens/update_box_details_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rOnBoardingRoute:
        return MaterialPageRoute(
          builder: (_) => Directionality(
            textDirection: TextDirection.rtl,
            child: SearchScreen(),
          ),
        );
      case AppRouterNames.rLoginRoute:

      default:
        return null;
    }
  }
}
