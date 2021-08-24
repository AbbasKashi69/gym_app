import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const textStyle = TextStyle(
  color: Color(0xff000000),
  fontSize: 12,
  fontWeight: FontWeight.w400,
  fontFamily: 'IRANSans',
);
const double padding = 10;
const kColorBackGroundQrCode = Color(0xffF2F2F2);
const kColorBackGround = Color(0xffffffff);
const kBodyDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(14), topRight: Radius.circular(14)));
const Color kColorAppbar = Color(0xffFBFBFB);
const Color kColorBackgroundItem = Color(0xffFBFBFB);
enum FontSize { title, subTitle, normal }
double kFontSizeText(Size sizeScreen, FontSize fontSize) {
  switch (fontSize) {
    case FontSize.title:
      return sizeScreen.width > 550 ? 17 : 14;
    case FontSize.subTitle:
      return sizeScreen.width > 550 ? 15 : 12;
    case FontSize.normal:
      return sizeScreen.width > 550 ? 13 : 10;
    default:
      return 10;
  }
}
