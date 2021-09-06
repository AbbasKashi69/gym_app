import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

class AllApprenticeScreen {
  Future allApprentice(
      BuildContext context, Size sizeScreen, dynamic data) async {
    await showModalBottomSheet(
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
              constraints: BoxConstraints(maxHeight: sizeScreen.height * 0.6),
              child: Container(
                width: sizeScreen.width * 0.8,
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
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'لیست شاگردان',
                        style: textStyle.copyWith(
                            fontSize: kFontSizeText(sizeScreen, FontSize.title),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                        padding: EdgeInsets.only(right: padding),
                        margin: EdgeInsets.symmetric(vertical: padding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(data['apprentice'][index]),
                              radius: sizeScreen.width > 550 ? 25 : 15,
                            ),
                            SizedBox(
                              width: padding,
                            ),
                            Text(
                              'علی صدیقی منش',
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle)),
                            ),
                            Spacer()
                          ],
                        ),
                      ),
                      itemCount: data['apprentice'].length,
                    ))
                  ],
                ),
              ),
            ));
  }
}
