import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

class TurnItem extends StatelessWidget {
  const TurnItem({
    required this.index,
    required this.itemSelected,
    required this.onTapTopTurn,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  final int index;
  final int itemSelected;
  final Function onTapTopTurn;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTapTopTurn();
      },
      child: Container(
        decoration: BoxDecoration(
            color: itemSelected == index ? Colors.white : Color(0xff90E0EF),
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(30), left: Radius.circular(30))),
        margin: EdgeInsets.only(right: padding, left: padding, bottom: padding),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: padding),
        child: Center(
          child: Text(
            'نوبت $title',
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                color:
                    itemSelected == index ? Color(0xff00B4D8) : Colors.white),
          ),
        ),
      ),
    );
  }
}
