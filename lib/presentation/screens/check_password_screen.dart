import 'package:active_box/business_logic/global_cubit/global_cubit.dart';
import 'package:active_box/data/models/note_model.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/medium_text.dart';
import 'package:active_box/presentation/wedgit/my_button.dart';
import 'package:active_box/presentation/wedgit/my_form_field.dart';
import 'package:active_box/presentation/wedgit/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/main_cubit/main_cubit.dart';

class CheckPasswordScreen extends StatelessWidget {
  final NoteModel noteModel;

  CheckPasswordScreen({Key? key, required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return BlocConsumer<GlobalCubit, GlobalState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pop(context);
        GlobalCubit.get(context).donePassword();
        return false;
      },
      child: Scaffold(
            body: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(18.0.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const HeadLineText(
                        text: 'ادخال كلمة المرور',
                        maxLines: 1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      MyFormField(
                        controller: passwordController,
                        validateText: 'من فضلك ادخل كلمة المرور',
                        maxLines: 1,
                        inputType: TextInputType.text,
                        hintText: 'كلمة المرور',
                        prefix: IconBroken.Lock,
                        suffixPressed: () {
                          MainCubit.get(context).changePasswordVisiability1();
                        },
                        suffix: MainCubit.get(context).prefix1,
                        isPassword: MainCubit.get(context).isPassword1,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      MyButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (passwordController.text == noteModel.password) {
                              Navigator.pushReplacementNamed(
                                  context, AppRouterNames.rBoxDetailsScreenRoute,
                                  arguments: noteModel);
                              GlobalCubit.get(context).donePassword();
                            } else {
                              GlobalCubit.get(context).ifWrongPassword();
                            }
                          }
                        },
                        text: 'تاكيد',
                      ),
                      if (state is WrongPasswordState)
                        Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            MediumText(
                              text: 'الرقم السرى غير مطابق',
                              color: AppColor.red,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  },
);
      },
    );
  }
}
