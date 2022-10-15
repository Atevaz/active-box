
import 'package:active_box/presentation/styles/colors.dart';
import 'package:flutter/material.dart';

import 'medium_text.dart';

class DefaultTextButton extends StatelessWidget {

  final String text ;
  final VoidCallback onPressed ;
  final Color color;

  const DefaultTextButton({Key? key , required this.text , required this.onPressed ,this.color = AppColor.blue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: MediumText(text: text,color: color,),
    );
  }
}
