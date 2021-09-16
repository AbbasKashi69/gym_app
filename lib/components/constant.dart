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
var textStyleHome = TextStyle(
    color: Colors.white,
    fontSize: Get.width * 0.04,
    fontWeight: FontWeight.w600,
    fontFamily: 'IRANSans');
var textStyleSubscription = TextStyle(
    color: Colors.black,
    fontSize: Get.width * 0.05,
    fontWeight: FontWeight.w600,
    fontFamily: 'IRANSans');
var textStyleSubscription2 = TextStyle(
    color: Colors.black,
    fontSize: Get.width * 0.04,
    fontWeight: FontWeight.w700,
    fontFamily: 'IRANSans');
var textStyleBuySubscription = TextStyle(
    color: Colors.white,
    fontSize: Get.width * 0.04,
    fontWeight: FontWeight.w400,
    fontFamily: 'IRANSans');
var textStyleBuySubscription2 = TextStyle(
    color: Colors.white,
    fontSize: Get.width * 0.05,
    fontWeight: FontWeight.w500,
    fontFamily: 'IRANSans');
final InputDecoration kInputDecorationRegister = InputDecoration(
    alignLabelWithHint: true,
    labelStyle: textStyle.copyWith(
      fontSize: 12,
      color: Colors.grey,
    ),
    errorStyle: textStyle.copyWith(color: Color(0xffFF0034), fontSize: 12),
    errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
      color: Color(0xffFF0034),
    )));
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

final InputDecoration kInputDecorationTextField = InputDecoration(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xffEBEBEB))),
  contentPadding: EdgeInsets.only(right: padding),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xffDB4545))),
  disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xffEBEBEB))),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xffEBEBEB))),
  errorStyle: textStyle.copyWith(
      color: Color(0xffDB4545), fontSize: Get.width > 550 ? 12 : 10),
  filled: true,
  fillColor: Color(0xffFBFBFB),
  hintStyle: textStyle.copyWith(
      fontSize: Get.width > 550 ? 12 : 10, color: Color(0xffA2A2A2)),
);

const Color kHintText = Color(0xffA2A2A2);

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {Key? key,
      required this.sizeScreen,
      required this.title,
      this.isReject = false,
      required this.onTap})
      : super(key: key);

  final Size sizeScreen;
  final String title;
  final Function onTap;
  final bool isReject;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20)),
            gradient: LinearGradient(
                colors: isReject
                    ? [Color(0xffEFEFEF), Color(0xffF5F5F5)]
                    : [Color(0xff00B4D8), Color(0xff48CAE4)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter)),
        child: InkWell(
          onTap: () {
            onTap();
          },
          splashColor: Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(20), right: Radius.circular(20)),
          child: Container(
            height: Get.height * 0.07,
            width: Get.width * 0.8,
            child: Center(
              child: Text(
                title,
                style: textStyle.copyWith(
                    fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                    color: isReject ? Colors.black : Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
