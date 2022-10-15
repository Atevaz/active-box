import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/view/box_view.dart';
import 'package:active_box/presentation/wedgit/my_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
          child: Padding(
            padding: EdgeInsets.all(18.r),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: MyFormField(
                          controller: searchController,
                          validateText: '',
                          inputType: TextInputType.text,
                          hintText: 'بحث',

                        )),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      height: 56.h,
                      width: 56.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: AppColor.blue
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(IconBroken.Search,color: AppColor.white,),
                      ),
                    )
                  ],
                ),
                BoxView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
