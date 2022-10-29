import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/data/models/note_model.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/my_button.dart';
import 'package:active_box/presentation/wedgit/my_form_field.dart';
import 'package:active_box/presentation/wedgit/show_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../wedgit/regular_text.dart';

class ConfirmPasswordScreen extends StatelessWidget {
  final String password;
  final NoteModel noteModel;

  ConfirmPasswordScreen({Key? key, required this.password,required this.noteModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var confirmPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();


    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.all(18.0.r),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [
                      const HeadLineText(text: 'تاكيد كلمة المرور',
                        maxLines: 1,
                        textAlign: TextAlign.center,),
                      SizedBox(height: 15.h,),
                      MyFormField(
                        controller: confirmPasswordController,
                        validateText: 'من فضلك ادخل كملة المرور',
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
                          MainCubit.get(context).checkPasswordArabicValidation(value);
                          MainCubit.get(context).checkPasswordCapitalEnglishValidation(value);
                          MainCubit.get(context).checkPasswordSmallEnglishValidation(value);
                          MainCubit.get(context).checkPasswordSymbolEnglishValidation(value);
                          MainCubit.get(context).checkPasswordNumberEnglishValidation(value);
                          MainCubit.get(context).checkPasswordLengthValidation(value);
                        },
                      ),
                      SizedBox(height: 15.h,),
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Column(
                          children: [
                            Row(
                              children:  [
                                Icon(IconBroken.Shield_Done,color: MainCubit.get(context).isArabic == false ? AppColor.red : AppColor.green),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RegularText(text: 'احتواء كلمة المرور على حروف عربية',color:MainCubit.get(context).isArabic == false ? AppColor.red : AppColor.green,),
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
                                Icon(IconBroken.Shield_Done,color: MainCubit.get(context).isCapitalEnglish == false ? AppColor.red : AppColor.green),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RegularText(text: 'احتواء كلمة المرور على حروف انجليزية كبيرة',color: MainCubit.get(context).isCapitalEnglish == false ? AppColor.red : AppColor.green),
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
                                Icon(IconBroken.Shield_Done,color: MainCubit.get(context).isSmallEnglish == false ? AppColor.red : AppColor.green),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RegularText(text: 'احتواء كلمة المرور على حروف انجليزية صغيرة',color:  MainCubit.get(context).isSmallEnglish == false ? AppColor.red : AppColor.green),
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
                                Icon(IconBroken.Shield_Done,color: MainCubit.get(context).isSymbols == false ? AppColor.red : AppColor.green),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RegularText(text: 'احتواء كلمة المرور على رموز',color: MainCubit.get(context).isSymbols == false ? AppColor.red : AppColor.green),
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
                                Icon(IconBroken.Shield_Done,color: MainCubit.get(context).isNumbers == false ? AppColor.red : AppColor.green),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RegularText(text: 'احتواء كلمة المرور على ارقام',color:  MainCubit.get(context).isNumbers == false ? AppColor.red : AppColor.green),
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
                                Icon(IconBroken.Shield_Done,color: MainCubit.get(context).isTall == false ? AppColor.red : AppColor.green),
                                SizedBox(
                                  width: 10.w,
                                ),
                                RegularText(text: 'احتواء كلمة المرور على 25 حرف',color:  MainCubit.get(context).isTall == false ? AppColor.red : AppColor.green),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                          ],
                        ),
                      ),
                      MyButton(onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (confirmPasswordController.text == password) {
                            MainCubit.get(context).updateNoteDetails(noteModel.id, title: noteModel.title!, details: noteModel.details!, password: confirmPasswordController.text, idNote: noteModel.id!).then((value) {
                              Navigator.pushReplacementNamed(
                                  context, AppRouterNames.rBoxDetailsScreenRoute,arguments:NoteModel(title: noteModel.title!, details: noteModel.details!,password: password,id: noteModel.id));
                            });
                          }
                          else {
                            showToast(text: 'كلمة المرور غير مطابقة',
                                state: ToastStates.ERROR);
                          }
                        }
                      }, text: 'تاكيد')

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
