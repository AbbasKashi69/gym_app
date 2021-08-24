import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';

class NoCvScreen {
  Future<void> noCv(BuildContext context, Size sizeScreen) async {
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
                    height: 10,
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/noCv.svg',
                            width: sizeScreen.height * 0.2,
                            height: sizeScreen.height * 0.2,
                          ),
                          SizedBox(
                            height: padding,
                          ),
                          Text(
                            'کاربر رزومه ندارد',
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    MediaQuery.of(context).size,
                                    FontSize.title),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}
