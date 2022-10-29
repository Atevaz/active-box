import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/data/models/note_model.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/medium_text.dart';
import 'package:active_box/presentation/wedgit/my_button.dart';
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
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRouterNames.rHomeScreenRoute,
              (route) {
                return false;
              },
            );
            return false;
          },
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRouterNames.rHomeScreenRoute,
                    (route) {
                      return false;
                    },
                  );
                },
                icon: const Icon(IconBroken.Arrow___Right),
              ),
              actions: [
                IconButton(
                  onPressed: () {

                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.r),
                          ),
                        ),
                        backgroundColor: AppColor.black,
                        child: Container(
                          width: double.infinity,
                          height: 150.h,
                          decoration: BoxDecoration(
                            color: AppColor.backGroundColor,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0.r),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                RegularText(
                                    text:
                                    'هل تريد حذف هذه المذكرة'),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    MyButton(
                                      onPressed: () {
                                        MainCubit.get(context).deleteNote(noteModel.id);
                                        Navigator.pushNamedAndRemoveUntil(context,AppRouterNames.rHomeScreenRoute,(route){
                                          return false ;
                                        });
                                      },
                                      text: 'حذف',
                                      color: AppColor.blue,
                                      width: 80.w,
                                    ),
                                    MyButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      text: 'الغاء',
                                      color: AppColor.red,
                                      width: 80.w,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      barrierDismissible: false,
                    );
                  },
                  icon: const Icon(IconBroken.Delete),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, AppRouterNames.rEditBoxDetailsScreenRoute,
                        arguments: noteModel);
                  },
                  icon: const Icon(IconBroken.Edit),
                ),
                if (noteModel.password == null)
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, AppRouterNames.rCreatePasswordRoute,
                          arguments: noteModel);
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
          ),
        );
      },
    );
  }
}
