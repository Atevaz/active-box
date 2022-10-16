import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/data/models/note_model.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/my_button.dart';
import 'package:active_box/presentation/wedgit/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        return Scaffold(
          body: Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.all(18.0.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const HeadLineText(text: 'تاكيد الرقم السري',
                      maxLines: 1,
                      textAlign: TextAlign.center,),
                    SizedBox(height: 15.h,),
                    TextFormField(
                      maxLines: 1,
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "من فضلك ادخل الرقم السري";
                        }
                      },
                      keyboardType: TextInputType.text,
                      textAlign: TextAlign.start,

                      autofocus: true,

                      decoration: InputDecoration(
                        hintText: 'تاكيد الرقم السري',
                        hintStyle:
                        TextStyle(color: AppColor.greyOfText),
                        fillColor: AppColor.backGroundColor,
                        filled: true,
                        border: const OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide(
                            color: AppColor.blue,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: AppColor.red,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: AppColor.red,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: const BorderSide(
                            color: AppColor.lightGrey,
                            width: 2.0,
                          ),
                        ),
                      ),
                      style: const TextStyle(color: AppColor.black),
                    ),
                    SizedBox(height: 15.h,),
                    MyButton(onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (confirmPasswordController.text == password) {
                          MainCubit.get(context).updateNoteDetails(noteModel.id, title: noteModel.title!, details: noteModel.details!, password: confirmPasswordController.text, idNote: noteModel.id!).then((value) {
                            Navigator.pushReplacementNamed(
                                context, AppRouterNames.rBoxDetailsScreenRoute,arguments:noteModel);
                          });

                        }
                        else {
                          showToast(text: 'الرقم السري غير مطابق',
                              state: ToastStates.ERROR);
                        }
                      }
                    }, text: 'تاكيد')

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
