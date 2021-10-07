import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';

class ItemConversation extends StatelessWidget {
  const ItemConversation({Key? key, required this.image, required this.title})
      : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(vertical: padding / 2, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kColorBackgroundItem),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(image),
            SizedBox(
              width: padding / 2,
            ),
            Text(
              title,
              textAlign: TextAlign.right,
              style: textStyle.copyWith(
                  fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
            )
          ],
        ));
  }
}
