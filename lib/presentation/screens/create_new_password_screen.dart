import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/my_button.dart';
import 'package:active_box/presentation/wedgit/show_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*\W)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&+_;*(),.?:{}|<>])(?=.*[\u0600-\u06ff]|[\u0750-\u077f]|[\ufb50-\ufc3f]|[\ufe70-\ufefc])");
    //A function that validate user entered password
    bool validatePassword(String pass){
      String _password = pass.trim();
      if(pass_valid.hasMatch(_password)){
        return true;
      }else{
        return false;
      }
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding:  EdgeInsets.all(18.0.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                HeadLineText(text: 'الرقم السري',maxLines: 1,textAlign: TextAlign.center,),
                SizedBox(height: 15.h,),
                TextFormField(
                  maxLines: 1,
                  controller: passwordController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "من فضلك ادخل الرقم السري";
                    }
                    else{
                      if(value.length<10)
                      {
                        showToast(text: 'كلمة السر صغيرة يجب ان تكون 25', state: ToastStates.ERROR);

                      }
                      bool result = validatePassword(value);
                      if(result){
                        print('succsuce');
                        // create account event
                        return null;
                      }else{
                        print('faild');

                        showToast(text: 'يجب أن تحتوي كلمة المرور على حرروف لغة عربية ولغة انجليزية ورموز وارقام', state: ToastStates.ERROR);
                      }
                    }
                  },
                  keyboardType: TextInputType.text,
                  textAlign: TextAlign.start,


                  decoration:  InputDecoration(
                    hintText: 'الرقم السري' ,
                    hintStyle:
                    TextStyle(color: AppColor.greyOfText),
                    fillColor: AppColor.backGroundColor,
                    filled: true,
                    border: const OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide:  BorderSide(
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
                      borderSide:  const BorderSide(
                        color: AppColor.lightGrey,
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: const TextStyle(color: AppColor.black),
                ),
                SizedBox(height: 15.h,),
                MyButton(onPressed: (){
                  if(formKey.currentState!.validate())
                  {
                    Navigator.pushNamed(context, AppRouterNames.rConfirmPasswordRoute,arguments: passwordController.text);
                  }
                }, text: 'تاكيد')

              ],
            ),
          ),
        ),
      ),
    );
  }
}
