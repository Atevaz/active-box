
import 'package:active_box/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFormField extends StatelessWidget {
  final IconData? prefix;
  final IconData? suffix;

  final TextEditingController controller;

  final String validateText;

  final bool isPassword;

  final double borderRadius;

  final bool readOnly;

  final TextInputType inputType;

  final String? hintText;
  final String? labelText;
  final TextAlign textAlign;

  final Function()? suffixPressed;

  const MyFormField({
    Key? key,
    this.borderRadius = 15,
    required this.controller,
    required this.validateText,
    this.suffixPressed,
    this.isPassword = false,
    required this.inputType,
    this.hintText,
    this.prefix,
    this.suffix,
    this.textAlign = TextAlign.start,
    this.readOnly = false,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return validateText;
          }
          return null;
        },
        obscureText: isPassword,
        keyboardType: inputType,
        textAlign: textAlign,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: AppColor.greyOfText,
            ),
          ),
          prefixIcon: Icon(
            prefix,
            color: AppColor.greyOfText,
          ),
          hintText: hintText ,
          labelText: labelText ,
          labelStyle:
              const TextStyle(color: AppColor.greyOfText),
          hintStyle:
              const TextStyle(color: AppColor.greyOfText),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: const BorderSide(
                    color: AppColor.blue,
                  ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: const BorderSide(
              color: AppColor.red,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide: const BorderSide(
              color: AppColor.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
            borderSide:  const BorderSide(
                    color: AppColor.lightGrey,
                    width: 2.0,
                  ),
          ),
          fillColor: AppColor.lightGrey,
          filled: true,
        ),
        style: const TextStyle(color: AppColor.black),
      ),
    );
  }
}
