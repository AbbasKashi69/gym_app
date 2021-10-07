import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

class ItemAttribute extends StatelessWidget {
  const ItemAttribute({Key? key, required this.answer, required this.title})
      : super(key: key);
  final String title;
  final String answer;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: textStyle.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
        ),
        SizedBox(
          width: padding / 5,
        ),
        Text(
          answer,
          style: textStyle.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
        ),
      ],
    );
  }
}
