import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class WarningDelteTrunScreen {
  Future warningDeleteTrun(
      BuildContext context, Size sizeScreen, String turn) async {
    var result = await showModalBottomSheet(
        isDismissible: false,
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
                      SvgPicture.asset(
                        'assets/icons/trashInBottomSheet.svg',
                        width: kFontSizeText(sizeScreen, FontSize.title) + 17,
                        height: kFontSizeText(sizeScreen, FontSize.title) + 17,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        turn != '3'
                            ? 'برنامه روز ${turn.toWord()}م حذف شود ؟'
                            : 'برنامه روز سوم حذف شود ؟',
                        style: textStyle.copyWith(
                            fontSize: kFontSizeText(sizeScreen, FontSize.title),
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: sizeScreen.width * 0.8,
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomeButton(
                                      sizeScreen: sizeScreen,
                                      title: 'خیر',
                                      isReject: true,
                                      onTap: () {
                                        Navigator.of(context).pop(false);
                                      })),
                              SizedBox(
                                width: padding,
                              ),
                              Expanded(
                                  child: CustomeButton(
                                      sizeScreen: sizeScreen,
                                      title: 'حذف',
                                      onTap: () {
                                        Navigator.of(context).pop(true);
                                      }))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
    return result;
  }
}
