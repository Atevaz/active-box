import 'package:active_box/data/models/note_model.dart';
import 'package:active_box/presentation/screens/add_note_screen.dart';
import 'package:active_box/presentation/screens/box_details.dart';
import 'package:active_box/presentation/screens/check_password_screen.dart';
import 'package:active_box/presentation/screens/confirm_password_screen.dart';
import 'package:active_box/presentation/screens/home_screen.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/screens/create_new_password_screen.dart';
import 'package:active_box/presentation/screens/search_screen.dart';
import 'package:active_box/presentation/screens/update_box_details_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rHomeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => const Directionality(
            textDirection: TextDirection.rtl,
            child: HomeScreen(),
          ),
        );
      case AppRouterNames.rAddNoteRoute:
        return MaterialPageRoute(
          builder: (_) =>  const Directionality(
            textDirection: TextDirection.rtl,
            child: AddNoteScreen(),
          ),
        );
      case AppRouterNames.rCreatePasswordRoute:
        final note = settings.arguments as NoteModel;
        return MaterialPageRoute(
          builder: (_) =>   Directionality(
            textDirection: TextDirection.rtl,
            child: CreateNewPasswordScreen(noteModel: note,),
          ),
        );
      case AppRouterNames.rConfirmPasswordRoute:
        final String password=settings.arguments as String;
        final note = settings.arguments as NoteModel;
        return MaterialPageRoute(
          builder: (_) =>  Directionality(
            textDirection: TextDirection.rtl,
            child: ConfirmPasswordScreen(password: password, noteModel: note,),
          ),
        );
      case AppRouterNames.rBoxDetailsScreenRoute:
        final note = settings.arguments as NoteModel;
        return MaterialPageRoute(
          builder: (_) =>   Directionality(
            textDirection: TextDirection.rtl,
            child: BoxDetailsScreen(noteModel:note),
          ),
        );
      case AppRouterNames.rSearchScreenRoute:
        return MaterialPageRoute(
          builder: (_) =>   Directionality(
            textDirection: TextDirection.rtl,
            child: SearchScreen(),
          ),
        );
      case AppRouterNames.rEditBoxDetailsScreenRoute:
        final note = settings.arguments as NoteModel;
        return MaterialPageRoute(
          builder: (_) =>    Directionality(
            textDirection: TextDirection.rtl,
            child: UpdateBoxDetailsScreen(noteModel: note),
          ),
        );
      case AppRouterNames.rCheckPasswordRoute:
        final note = settings.arguments as NoteModel;
        return MaterialPageRoute(
          builder: (_) =>    Directionality(
            textDirection: TextDirection.rtl,
            child: CheckPasswordScreen(noteModel: note),
          ),
        );

      default:
        return null;
    }
  }
}
