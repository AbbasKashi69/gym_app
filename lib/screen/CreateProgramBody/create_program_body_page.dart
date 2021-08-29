import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

class CreateProgramBodyPage extends StatelessWidget {
  const CreateProgramBodyPage({Key? key}) : super(key: key);
  static const routeName = '/createProgramBodyPage';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: 'ایجاد برنامه بدنسازی',
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: padding * 2, vertical: padding),
          decoration: kBodyDecoration,
          constraints: BoxConstraints(minHeight: Get.height),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: Get.width * 0.8,
              child: Column(
                children: [
                  TextField(
                    decoration: kInputDecorationTextField.copyWith(
                        hintStyle: textStyle.copyWith(
                            fontSize: Get.width > 550 ? 12 : 10,
                            color: kHintText),
                        hintText: 'نام برنامه'),
                    style: textStyle.copyWith(
                      fontSize: kFontSizeText(
                        sizeScreen,
                        FontSize.subTitle,
                      ),
                    ),
                  ),
                  SizedBox(height: padding * 2),
                  TextField(
                    decoration: kInputDecorationTextField.copyWith(
                        hintStyle: textStyle.copyWith(
                            fontSize: Get.width > 550 ? 12 : 10,
                            color: kHintText),
                        hintText: 'نام برنامه'),
                    style: textStyle.copyWith(
                      fontSize: kFontSizeText(
                        sizeScreen,
                        FontSize.subTitle,
                      ),
                    ),
                  ),
                  SizedBox(height: padding * 2),
                  TextField(
                    decoration: kInputDecorationTextField.copyWith(
                        hintStyle: textStyle.copyWith(
                            fontSize: Get.width > 550 ? 12 : 10,
                            color: kHintText),
                        hintText: 'تاریخ شروع'),
                    style: textStyle.copyWith(
                      fontSize: kFontSizeText(
                        sizeScreen,
                        FontSize.subTitle,
                      ),
                    ),
                  ),
                  SizedBox(height: padding * 2),
                  TextField(
                    decoration: kInputDecorationTextField.copyWith(
                        hintStyle: textStyle.copyWith(
                            fontSize: Get.width > 550 ? 12 : 10,
                            color: kHintText),
                        hintText: 'تاریخ پایان'),
                    style: textStyle.copyWith(
                      fontSize: kFontSizeText(
                        sizeScreen,
                        FontSize.subTitle,
                      ),
                    ),
                  ),
                  SizedBox(height: padding * 2),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: padding),
                    padding: EdgeInsets.symmetric(
                        horizontal: padding, vertical: padding),
                    decoration: ShapeDecoration(
                        color: Color(0xfffBfBfB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xffEBEBEB)))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              size: kFontSizeText(sizeScreen, FontSize.title),
                              color: Color(0xff48CAE4),
                            ),
                            SizedBox(
                              width: padding / 2,
                            ),
                            Text(
                              'افزودن شاگرد',
                              style: textStyle.copyWith(
                                color: Color(0xff48CAE4),
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
                              ),
                            )
                          ],
                        ),
                        Icon(
                          Icons.person_add_alt_rounded,
                          size: kFontSizeText(sizeScreen, FontSize.title),
                          color: Color(0xff48CAE4),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: padding),
                        padding: EdgeInsets.symmetric(
                            horizontal: padding, vertical: padding),
                        decoration: ShapeDecoration(
                            color: Color(0xfffBfBfB),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Color(0xffEBEBEB)))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'علی کریمی',
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle)),
                            ),
                            SizedBox(
                              width: padding,
                            ),
                            Container(
                              width: 10,
                              height: 2,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: padding,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: padding, bottom: padding),
                    padding: EdgeInsets.only(right: padding, top: padding),
                    decoration: ShapeDecoration(
                        color: Color(0xfffBfBfB),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xffEBEBEB)))),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'نظرتان را بنویسید...',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: padding / 2, vertical: padding / 2),
                          border: InputBorder.none),
                      minLines: 7,
                      // any number you need (It works as the rows for the textarea)
                      // maxLength: 1000,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      textAlign: TextAlign.justify,
                      style: textStyle.copyWith(
                          height: 1.5,
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle)),
                    ),
                  ),
                  SizedBox(
                    height: padding,
                  ),
                  CustomeButton(
                    sizeScreen: sizeScreen,
                    title: 'ادامه',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {Key? key,
      required this.sizeScreen,
      required this.title,
      required this.onTap})
      : super(key: key);

  final Size sizeScreen;
  final String title;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20)),
            gradient: LinearGradient(
                colors: [Color(0xff00B4D8), Color(0xff48CAE4)],
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
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
