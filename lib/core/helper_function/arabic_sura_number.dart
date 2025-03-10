import 'package:flutter/material.dart';
import 'package:ytquran/core/helper_function/arabic_no_converter.dart';
import 'package:ytquran/core/utils/app_colors.dart';
import 'package:ytquran/core/utils/app_text_style.dart';

class ArabicSuraNumber extends StatelessWidget {
  const ArabicSuraNumber({Key? key, required this.i}) : super(key: key);
  final int i;
  @override
  Widget build(BuildContext context) {
    return Text(
      "\uFD3E" + (i + 1).toString().toArabicNumbers + "\uFD3F",
      style: TextStyles.textStylequran
          .copyWith(color: AppColors.primaryColorBlack, shadows: [
        Shadow(
          offset: Offset(.5, .5),
          blurRadius: 1.0,
          color: Colors.amberAccent,
        ),
      ]),
    );
  }
}
