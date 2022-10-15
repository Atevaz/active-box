import 'package:active_box/constants/assets_manager.dart';
import 'package:active_box/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

import '../wedgit/regular_text.dart';

class BoxView extends StatelessWidget {
  const BoxView({Key? key}) : super(key: key);

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
        6,
            (index) => InkWell(
              onTap: (){
                /// routing
              },
              child: Container(
                  width: 150,
                  height: 190,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          AssetsManager.boxBackgroundPath,
                        ),
                        fit: BoxFit.contain),
                  ),
                  child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 50,left: 40,right: 40,bottom: 50),
                        child: RegularText(
                          text:
                          'الرقم السرى بتاعى',
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
