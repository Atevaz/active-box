import 'package:active_box/business_logic/main_cubit/main_cubit.dart';
import 'package:active_box/constants/assets_manager.dart';
import 'package:active_box/presentation/router/app_router_names.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../wedgit/regular_text.dart';

class BoxView extends StatelessWidget {
  final dynamic list;
  const BoxView({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 2 / 2,
      children: List.generate(
        list.length,
            (index) => InkWell(
              onTap: (){
                if(list[index].password == null ||list[index].password=="" )
                {
                  Navigator.pushNamed(context, AppRouterNames.rBoxDetailsScreenRoute,arguments:list[index]);
                }
                else
                  {
                    Navigator.pushNamed(context, AppRouterNames.rCheckPasswordRoute,arguments:list[index]);
                  }
              },
              child: Container(
                  width: 150,
                  height: 190,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                        image: AssetImage(
                          AssetsManager.boxBackgroundPath1,
                        ),
                        fit: BoxFit.contain),
                  ),
                  child:  Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50,left: 40,right: 40,bottom: 50),
                        child: RegularText(
                          text: list[index].title!,
                          color: AppColor.white,
                          textAlign: TextAlign.center,
                          maxLines: 3,

                        ),
                      ))),
            ),
      ),
    );
  }
}
