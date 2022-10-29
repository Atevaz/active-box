import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../wedgit/regular_text.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var detailsController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    final focus = FocusNode();
    bool isChanged = false;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return WillPopScope(
          onWillPop: ()async{
            if (isChanged) {
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
                      borderRadius:
                      BorderRadius.circular(15.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.0.r),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          RegularText(
                              text:
                              'هل تريد الرجوع الى الخلف بدون تغيراتك'),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              MyButton(
                                onPressed: () {
                                  Navigator
                                      .pushNamedAndRemoveUntil(
                                      context,
                                      AppRouterNames
                                          .rHomeScreenRoute,
                                          (route) {
                                        return false;
                                      });
                                },
                                text: 'نعم',
                                color: AppColor.blue,
                                width: 80.w,
                                height: 50,
                              ),
                              MyButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                text: 'الغاء',
                                color: AppColor.red,
                                width: 80.w,
                                height: 50,
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
            } else {
              Navigator.pop(context);
            }
            return false;
          },
          child: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (isChanged) {
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
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0.r),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RegularText(
                                                text:
                                                    'هل تريد الرجوع الى الخلف بدون تغيراتك'),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                MyButton(
                                                  onPressed: () {
                                                    Navigator
                                                        .pushNamedAndRemoveUntil(
                                                            context,
                                                            AppRouterNames
                                                                .rHomeScreenRoute,
                                                            (route) {
                                                      return false;
                                                    });
                                                  },
                                                  text: 'نعم',
                                                  color: AppColor.blue,
                                                  width: 80.w,
                                                  height: 50,
                                                ),
                                                MyButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  text: 'الغاء',
                                                  color: AppColor.red,
                                                  width: 80.w,
                                                  height: 50,
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
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            icon: const Icon(
                              IconBroken.Arrow___Right,
                              color: AppColor.blue,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              textDirection: TextDirection.rtl,
                              maxLines: 1,
                              controller: titleController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'من فضلك ادخل العنوان';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.multiline,
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                hintText: 'العنوان',
                                hintStyle:
                                    TextStyle(color: AppColor.greyOfText),
                                border: InputBorder.none,
                                fillColor: AppColor.backGroundColor,
                                filled: true,
                              ),
                              style: const TextStyle(color: AppColor.black),
                              onFieldSubmitted: (v) {
                                FocusScope.of(context).requestFocus(focus);
                              },
                              onChanged: (v) {
                                isChanged = true;
                              },
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: TextFormField(
                            focusNode: focus,
                            onChanged: (v) {
                              isChanged = true;
                            },
                            textDirection: TextDirection.rtl,
                            maxLines: 1000,
                            controller: detailsController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل المحتوي';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.multiline,
                            textAlign: TextAlign.start,
                            decoration: const InputDecoration(
                              hintText: 'المحتوي',
                              hintStyle: TextStyle(color: AppColor.greyOfText),
                              border: InputBorder.none,
                              fillColor: AppColor.backGroundColor,
                              filled: true,
                            ),
                            style: const TextStyle(color: AppColor.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: state is GetAllNotesLoadingState ?  Center(child: CircularProgressIndicator(),) : Padding(
              padding: EdgeInsets.all(18.r),
              child: MyButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    MainCubit.get(context)
                        .addNote(
                      title: titleController.text,
                      details: detailsController.text.isEmpty ? ' ' : detailsController.text,
                    )
                        .then((value) {
                      Navigator.pushReplacementNamed(
                          context, AppRouterNames.rHomeScreenRoute);
                    });
                  }
                },
                text: 'حفظ',
              ),
            ) ,
          ),
        );
      },
    );
  }
}
