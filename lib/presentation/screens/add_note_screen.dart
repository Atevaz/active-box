import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var detailsController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:
                    [
                      Row(
                        children:
                        [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              IconBroken.Arrow___Right, color: AppColor.blue,
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Expanded(
                            child: TextFormField(
                              maxLines: 1,
                              controller: titleController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'من فضلك ادخل العنوان';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
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
                            ),
                          )
                        ],
                      ),
                      TextFormField(
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
                          hintStyle:
                          TextStyle(color: AppColor.greyOfText),
                          border: InputBorder.none,
                          fillColor: AppColor.backGroundColor,
                          filled: true,
                        ),
                        style: const TextStyle(color: AppColor.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.all(18.r),
            child: MyButton(onPressed: () {
              if (formKey.currentState!.validate())
              {
                MainCubit.get(context).addNote(title: titleController.text, details: detailsController.text).then((value) {
                  Navigator.pushReplacementNamed(context, AppRouterNames.rHomeScreenRoute);
                });
              }
            }, text: 'حفظ',),
          ),

        );
      },
    );
  }
}
