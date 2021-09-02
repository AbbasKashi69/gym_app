import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/components/constant.dart';

// this class is modal bottom sheet  for when tap on 'افزون عکس جدید' in coach list page
class SelectorImageScreen {
  Future<void> selectorImage(BuildContext context, Size sizeScreen) async {
    showModalBottomSheet(
        isDismissible: true,
        elevation: 20,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => Container(
              decoration: BoxDecoration(
                  color: kColorBackGround,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              constraints: BoxConstraints(maxHeight: sizeScreen.height * 0.4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: padding,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffE8E8E8),
                        borderRadius: BorderRadius.circular(10)),
                    width: sizeScreen.width * 0.1,
                    height: 5,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      child: Center(
                        child: Text(
                          'انتخاب تصویر:',
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.title),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Container(
                        width: sizeScreen.width * 0.8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: ItemWriteProgram(
                                listColor: [
                                  Color(0xffFF003D),
                                  Color(0xffFF3061)
                                ],
                                image: 'assets/icons/camera.svg',
                                title: 'دوربین',
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: ItemWriteProgram(
                                listColor: [
                                  Color(0xffFFCC00),
                                  Color(0xffFFD630)
                                ],
                                image: 'assets/icons/gallery.svg',
                                title: 'گالری',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}

// this widget is circle item in modal bottom sheet
class ItemWriteProgram extends StatelessWidget {
  const ItemWriteProgram(
      {Key? key,
      required this.image,
      required this.listColor,
      required this.title})
      : super(key: key);
  final List<Color> listColor;
  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.height * 0.1,
          height: Get.height * 0.1,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: listColor,
                center: Alignment(0.8, 0.8),
                startAngle: 1,
                stops: [0.55, 0.4],
                endAngle: pi * 2,
                tileMode: TileMode.clamp,
              )),
          child: Center(
            child: SvgPicture.asset(
              image,
              width: Get.width > 550 ? 30 : 20,
              height: Get.width > 550 ? 30 : 20,
            ),
          ),
        ),
        SizedBox(height: padding),
        Text(
          title,
          style: textStyle.copyWith(
              fontSize:
                  kFontSizeText(MediaQuery.of(context).size, FontSize.subTitle),
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
