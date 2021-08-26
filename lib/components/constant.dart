import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
var  textStyleHome = TextStyle(color: Colors.white,fontSize: Get.width * 0.04,fontWeight: FontWeight.w600,fontFamily: 'IRANSans');
var  textStyleSubscription = TextStyle(color: Colors.black,fontSize: Get.width * 0.05,fontWeight: FontWeight.w600,fontFamily: 'IRANSans');
var  textStyleSubscription2 = TextStyle(color: Colors.black,fontSize: Get.width * 0.04,fontWeight: FontWeight.w700,fontFamily: 'IRANSans');
var  textStyleBuySubscription = TextStyle(color: Colors.white,fontSize: Get.width * 0.04,fontWeight: FontWeight.w400,fontFamily: 'IRANSans');
var  textStyleBuySubscription2 = TextStyle(color: Colors.white,fontSize: Get.width * 0.05,fontWeight: FontWeight.w500,fontFamily: 'IRANSans');
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

