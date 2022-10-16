import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/data/models/note_model.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/medium_text.dart';
import 'package:active_box/presentation/wedgit/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxDetailsScreen extends StatelessWidget {
  final NoteModel noteModel;

  const BoxDetailsScreen({Key? key, required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconBroken.Arrow___Right),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  MainCubit.get(context).deleteNote(noteModel.id);
                  Navigator.pop(context);
                },
                icon: const Icon(IconBroken.Delete),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, AppRouterNames.rEditBoxDetailsScreenRoute,arguments: noteModel);
                },
                icon: const Icon(IconBroken.Edit),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, AppRouterNames.rCreatePasswordRoute,arguments: noteModel);
                },
                icon: const Icon(IconBroken.Lock),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(18.r),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MediumText(
                      text: 'التصنيف',
                      color: AppColor.blue,
                    ),
                     HeadLineText(
                      text: noteModel.title!,
                      maxLines: 3,
                    ),
                    RegularText(
                      fontSize: 20.sp,
                      text: noteModel.details!,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
