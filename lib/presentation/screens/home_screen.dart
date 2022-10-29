import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/view/box_view.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/medium_text.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadLineText(
          text: 'الصندوق التفاعلي',
          color: AppColor.blue,
        ),
        centerTitle: true,
        actions: [
           IconButton(
             padding: EdgeInsets.zero,
             onPressed: ()
             {
               Navigator.pushNamed(context, AppRouterNames.rSearchScreenRoute);
             },
               icon: const Icon(IconBroken.Search),
           ),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:  EdgeInsets.all(18.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                ConditionalBuilder(
                  condition: MainCubit.get(context).allNotes.isNotEmpty && state is !GetAllNotesLoadingState,
                  builder: (context) => BoxView(list: MainCubit.get(context).allNotes),
                  fallback: (context) =>const Center(child: MediumText(text: 'لا يوجد مذكرات بعد',),),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRouterNames.rAddNoteRoute);
        },
        child: const Icon(Icons.add),
        backgroundColor: AppColor.black,
      ),
    );
  },
);
  }
}
