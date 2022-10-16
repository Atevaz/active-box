import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/view/box_view.dart';
import 'package:active_box/presentation/wedgit/medium_text.dart';
import 'package:active_box/presentation/wedgit/my_form_field.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
      },
      builder: (context, state) {
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
                              maxLines: 1,
                              onChanged: (value)
                              {
                                MainCubit.get(context).getSearchNote(value);
                              },
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
                            icon: Icon(
                              IconBroken.Search, color: AppColor.white,),
                          ),
                        )
                      ],
                    ),
                    ConditionalBuilder(
                      condition: MainCubit.get(context).searchNote.isNotEmpty ,
                      builder: (context) => BoxView(list: MainCubit.get(context).searchNote),
                      fallback: (context) => Container(),
                    ),
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
