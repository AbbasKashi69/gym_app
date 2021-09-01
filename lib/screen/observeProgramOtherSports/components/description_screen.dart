import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';

class DescriptionOtherSports {
  Future<void> description(
      BuildContext context, Size sizeScreen, dynamic data) async {
    showModalBottomSheet(
        isDismissible: true,
        elevation: 20,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                    color: kColorBackGround,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                constraints: BoxConstraints(minHeight: sizeScreen.height * 0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffE8E8E8),
                          borderRadius: BorderRadius.circular(10)),
                      width: sizeScreen.width * 0.1,
                      height: 10,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      data['name'],
                      style: textStyle.copyWith(
                          fontSize: kFontSizeText(sizeScreen, FontSize.title),
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: sizeScreen.width * 0.8,
                        child: Text(
                          data['description'],
                          style: textStyle.copyWith(
                            fontSize:
                                kFontSizeText(sizeScreen, FontSize.subTitle),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ));
  }
}
