import 'package:active_box/business_logic/bloc_observer.dart';
import 'package:active_box/business_logic/global_cubit/global_cubit.dart';
import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/presentation/router/app_router.dart';
import 'package:active_box/presentation/styles/themes.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({required this.appRouter, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return MultiBlocProvider(
          providers:
          [
            BlocProvider(create: (context) => MainCubit()..getAllNotes()),
            BlocProvider(create: (context) => GlobalCubit()),
          ],
          child: BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state) {
            },
            builder: (context, state) {
              return MaterialApp(
                onGenerateRoute: appRouter.onGenerateRoute,
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                theme: lightTheme,
              );
            },
          ),
        );
      },
    );
  }
}

