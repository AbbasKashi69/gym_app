import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

class BottomFilter extends StatelessWidget {
  const BottomFilter(
      {Key? key,
      required this.title,
      required this.onTapBottomFilter,
      required this.isDoneByMe,
      required this.currentDay,
      required this.currentDayForSend})
      : super(key: key);
  final String title;
  final Function onTapBottomFilter;
  final bool isDoneByMe;
  final int currentDay;
  final int currentDayForSend;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            onTapBottomFilter();
          },
          child: Container(
            decoration: BoxDecoration(
                color: isDoneByMe && currentDay == currentDayForSend
                    ? Color(0xff48CAE4)
                    : Color(0xffCAF0F8),
                // color: Color(0xffCAF0F8),
                borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(30), left: Radius.circular(30))),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: padding),
            child: Center(
              child: Text(
                title,
                style: textStyle.copyWith(
                    fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                    color: isDoneByMe && currentDay == currentDayForSend
                        ? Colors.white
                        : Color(0xff0096C7)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
