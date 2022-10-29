import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/data/models/note_model.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/screens/confirm_password_screen.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/my_button.dart';
import 'package:active_box/presentation/wedgit/my_form_field.dart';
import 'package:active_box/presentation/wedgit/regular_text.dart';
import 'package:active_box/presentation/wedgit/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  final NoteModel noteModel;

  const CreateNewPasswordScreen({Key? key, required this.noteModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    RegExp pass_valid = RegExp(
        r"(?=.*\d)(?=.*\W)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+_;*(),.?:{}|<>])(?=.*[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc])");
    //A function that validate user entered password
    bool validatePassword(String pass) {
      String _password = pass.trim();
      if (pass_valid.hasMatch(_password)) {
        return true;
      } else {
        return false;
      }
    }

    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadLineText(
                      text: 'انشاء كلمة مرور',
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    MyFormField(
                      controller: passwordController,
                      validateText: 'من فضلك ادخل الرقم السري',
                      maxLines: 1,
                      inputType: TextInputType.text,
                      hintText: 'كلمة المرور',
                      prefix: IconBroken.Lock,
                      suffixPressed: (){
                        MainCubit.get(context).changePasswordVisiability();
                      },
                      suffix: MainCubit.get(context).prefix,
                      isPassword: MainCubit.get(context).isPassword,
                      onChanged: (value) {
                        MainCubit.get(context)
                            .checkPasswordArabicValidation(value);
                        MainCubit.get(context)
                            .checkPasswordCapitalEnglishValidation(value);
                        MainCubit.get(context)
                            .checkPasswordSmallEnglishValidation(value);
                        MainCubit.get(context)
                            .checkPasswordSymbolEnglishValidation(value);
                        MainCubit.get(context)
                            .checkPasswordNumberEnglishValidation(value);
                        MainCubit.get(context)
                            .checkPasswordLengthValidation(value);
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(IconBroken.Shield_Done,
                                  color:
                                      MainCubit.get(context).isArabic == false
                                          ? AppColor.red
                                          : AppColor.green),
                              SizedBox(
                                width: 10.w,
                              ),
                              RegularText(
                                text: 'احتواء كلمة المرور على حروف عربية',
                                color: MainCubit.get(context).isArabic == false
                                    ? AppColor.red
                                    : AppColor.green,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(IconBroken.Shield_Done,
                                  color:
                                      MainCubit.get(context).isCapitalEnglish ==
                                              false
                                          ? AppColor.red
                                          : AppColor.green),
                              SizedBox(
                                width: 10.w,
                              ),
                              RegularText(
                                  text:
                                      'احتواء كلمة المرور على حروف انجليزية كبيرة',
                                  color:
                                      MainCubit.get(context).isCapitalEnglish ==
                                              false
                                          ? AppColor.red
                                          : AppColor.green),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(IconBroken.Shield_Done,
                                  color:
                                      MainCubit.get(context).isSmallEnglish ==
                                              false
                                          ? AppColor.red
                                          : AppColor.green),
                              SizedBox(
                                width: 10.w,
                              ),
                              RegularText(
                                  text:
                                      'احتواء كلمة المرور على حروف انجليزية صغيرة',
                                  color:
                                      MainCubit.get(context).isSmallEnglish ==
                                              false
                                          ? AppColor.red
                                          : AppColor.green),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(IconBroken.Shield_Done,
                                  color:
                                      MainCubit.get(context).isSymbols == false
                                          ? AppColor.red
                                          : AppColor.green),
                              SizedBox(
                                width: 10.w,
                              ),
                              RegularText(
                                  text: 'احتواء كلمة المرور على رموز',
                                  color:
                                      MainCubit.get(context).isSymbols == false
                                          ? AppColor.red
                                          : AppColor.green),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(IconBroken.Shield_Done,
                                  color:
                                      MainCubit.get(context).isNumbers == false
                                          ? AppColor.red
                                          : AppColor.green),
                              SizedBox(
                                width: 10.w,
                              ),
                              RegularText(
                                  text: 'احتواء كلمة المرور على ارقام',
                                  color:
                                      MainCubit.get(context).isNumbers == false
                                          ? AppColor.red
                                          : AppColor.green),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(IconBroken.Shield_Done,
                                  color: MainCubit.get(context).isTall == false
                                      ? AppColor.red
                                      : AppColor.green),
                              SizedBox(
                                width: 10.w,
                              ),
                              RegularText(
                                  text: 'احتواء كلمة المرور على 25 حرف',
                                  color: MainCubit.get(context).isTall == false
                                      ? AppColor.red
                                      : AppColor.green),
                            ],
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    MyButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (MainCubit.get(context).isArabic == false) {
                              showToast(
                                  text:
                                      'يجب ان تحتوى كلمة المرور على حروف عربية',
                                  state: ToastStates.ERROR);
                            }
                            else if (MainCubit.get(context).isSmallEnglish ==
                                false) {
                              showToast(
                                  text:
                                      'يجب ان تحتوى كلمة المرور على حروف انجليزية صغيرة',
                                  state: ToastStates.ERROR);
                            } else if (MainCubit.get(context)
                                    .isCapitalEnglish ==
                                false) {
                              showToast(
                                  text:
                                      'يجب ان تحتوى كلمة المرور على حروف انجليزية كبيرة',
                                  state: ToastStates.ERROR);
                            } else if (MainCubit.get(context).isNumbers ==
                                false) {
                              showToast(
                                  text: 'يجب ان تحتوى كلمة المرور على ارقام',
                                  state: ToastStates.ERROR);
                            } else if (MainCubit.get(context).isSymbols ==
                                false) {
                              showToast(
                                  text: 'يجب ان تحتوى كلمة المرور على رموز',
                                  state: ToastStates.ERROR);
                            }
                            else if (passwordController.text.length < 25) {
                              showToast(
                                  text: 'يجب ان تكون كلمة المرور مكونة من 25 حرف',
                                  state: ToastStates.ERROR);
                            }else {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ConfirmPasswordScreen(
                                              password: passwordController.text,
                                              noteModel: noteModel)));
                              MainCubit.get(context).isCapitalEnglish = false;
                              MainCubit.get(context).isNumbers = false;
                              MainCubit.get(context).isSymbols = false;
                              MainCubit.get(context).isSmallEnglish = false;
                              MainCubit.get(context).isArabic = false;
                              MainCubit.get(context).isTall = false;
                            }
                          }
                        },
                        text: 'تاكيد')
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
