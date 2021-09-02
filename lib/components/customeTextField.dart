import 'package:flutter/material.dart';

import 'constant.dart';

class CustomeTextField extends StatelessWidget {
  const CustomeTextField({Key? key, this.hintText, this.isHaveIcon = false})
      : super(key: key);
  final String? hintText;
  final bool isHaveIcon;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return TextField(
      decoration: kInputDecorationTextField.copyWith(
          suffix: isHaveIcon
              ? Padding(
                  padding: EdgeInsets.only(left: padding, top: 5),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.add,
                      size: kFontSizeText(sizeScreen, FontSize.title) + 4,
                    ),
                  ),
                )
              : SizedBox(),
          prefix: isHaveIcon
              ? Padding(
                  padding: EdgeInsets.only(right: padding, top: 5),
                  child: InkWell(
                    onTap: () {},
                    child: Icon(Icons.remove,
                        size: kFontSizeText(sizeScreen, FontSize.title) + 4),
                  ),
                )
              : SizedBox(),
          hintStyle: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
              color: kHintText),
          hintText: hintText),
      style: textStyle.copyWith(
        fontSize: kFontSizeText(
          sizeScreen,
          FontSize.subTitle,
        ),
      ),
      textAlign: isHaveIcon ? TextAlign.center : TextAlign.right,
    );
  }
}
