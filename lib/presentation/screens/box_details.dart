import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/medium_text.dart';
import 'package:active_box/presentation/wedgit/regular_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoxDetailsScreen extends StatelessWidget {
  const BoxDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconBroken.Arrow___Right),
        ),
        actions: [
          IconButton(
            onPressed: () {
              /// routing
            },
            icon: Icon(IconBroken.Delete),
          ),
          IconButton(
            onPressed: () {
              /// routing
            },
            icon: Icon(IconBroken.Edit),
          ),
          IconButton(
            onPressed: () {
              /// routing
            },
            icon: Icon(IconBroken.Lock),
          ),
          SizedBox(
            width: 10.w,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(18.r),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MediumText(
                  text: 'التصنيف',
                  color: AppColor.blue,
                ),
                const HeadLineText(
                  text: 'عنوان الصندوق',
                  maxLines: 10,
                ),
                RegularText(
                  fontSize: 20.sp,
                  text:
                      'مره كنت بلعب كورة مره كنت بلعب كورةمره كنت بلعب كورة مره كنت بلعب كورةمره كنت بلعب كورة مره كنت بلعب كورةمره كنت بلعب كورة مره كنت بلعب كورة ',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
