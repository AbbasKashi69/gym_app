import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';

class NoAccess extends StatelessWidget {
  const NoAccess({Key? key, required this.isCoach}) : super(key: key);
  final bool isCoach;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/no_access.svg', width: 50, height: 50),
          SizedBox(
            height: 20,
          ),
          Text(
            isCoach
                ? 'برای دسترسی به شاگرد ابتدا درخواست او را تایید کنید'
                : 'برای دسترسی به مربی ابتدا او را دنبال کنید',
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.title)),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
