import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

class BottomFilter extends StatelessWidget {
  const BottomFilter(
      {Key? key,
      required this.title,
      required this.index,
      required this.onTapBottomFilter,
      required this.itemSelected})
      : super(key: key);
  final String title;
  final int index;
  final int itemSelected;
  final Function onTapBottomFilter;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTapBottomFilter();
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                itemSelected == index ? Color(0xff48CAE4) : Color(0xffCAF0F8),
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(30), left: Radius.circular(30))),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: padding),
        child: Center(
          child: Text(
            title,
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                color:
                    itemSelected == index ? Colors.white : Color(0xff0096C7)),
          ),
        ),
      ),
    );
  }
}
