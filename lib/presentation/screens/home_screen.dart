import 'package:active_box/constants/assets_manager.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:active_box/presentation/styles/icon_broken.dart';
import 'package:active_box/presentation/wedgit/headline_text.dart';
import 'package:active_box/presentation/wedgit/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const HeadLineText(text: 'الصندوق التفاعلى',color: AppColor.blue,),
        centerTitle: true,
        actions:  [
          const Icon(IconBroken.Search),
          SizedBox(
            width: 20.w,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
               width: 200,
                 height: 190,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     image:AssetImage(AssetsManager.logoPath,),
                     fit: BoxFit.contain
                   ),
                 ),
                 child: Center(child: MediumText(text: 'ulv uwhl hg]dk ufhsulv uwhl hg]dk ufhsulv uwhl hg]dk ufhs',color: AppColor.white,textAlign: TextAlign.center,)))
          ],
        ),
      )
    );
  }
}
