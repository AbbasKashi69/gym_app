import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

class ItemRejectAnswer extends StatelessWidget {
  const ItemRejectAnswer({
    Key? key,
    required this.isAnswer,
    required this.onTap,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;
  final bool isAnswer;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: padding / 2),
        width: sizeScreen.width * 0.15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
              colors: isAnswer
                  ? [Color(0xff00B4D8), Color(0xff48CAE4)]
                  : [Color(0xffE3E3E3), Color(0xffEFEFEF)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Center(
          child: Text(
            isAnswer ? 'تایید' : 'رد',
            style: textStyle.copyWith(
                color: isAnswer ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
