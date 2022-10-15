import 'package:active_box/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColor.backGroundColor,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.backGroundColor,
    ),

    appBarTheme: AppBarTheme(
      titleSpacing: 15,
      elevation: 0,

      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColor.backGroundColor,
        statusBarIconBrightness: Brightness.dark,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColor.blue,
      ),
      backgroundColor: AppColor.backGroundColor,
      iconTheme: IconThemeData(
        color: AppColor.blue,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24.sp,
        color: AppColor.blue,
        fontWeight: FontWeight.bold,
        fontFamily: 'SemiBold',
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      //backgroundColor: defaultColor,
      selectedItemColor: AppColor.blue,
      unselectedItemColor: Colors.black54,
      elevation: 20,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Regular',
        fontSize: 17.sp,
      ),
     /* unselectedLabelStyle: TextStyle(
        fontFamily: 'Regular',
        fontSize: 17.sp,
      ),
      selectedIconTheme: IconThemeData(
        size: 30,
      ),
      unselectedIconTheme: IconThemeData(
        size: 30,
      ),*/
    ),
    iconTheme: IconThemeData(
      color: AppColor.black,
    ),
    //fontFamily: 'SemiBold',
    //cardColor: AppColor.white,
    cardTheme: CardTheme(
      color: AppColor.white,
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.r),),
      ),
    )
);
