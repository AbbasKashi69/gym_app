import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

import 'description_screen.dart';

class ItemOtherSport extends StatelessWidget {
  const ItemOtherSport({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        child: Container(
            margin: EdgeInsets.symmetric(vertical: padding),
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(color: Color(0xff48CAE4), width: 5))),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data['name'],
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.title)),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Color(0xff707070))),
                  onPressed: () async {
                    await DescriptionOtherSports()
                        .description(context, sizeScreen, data);
                  },
                  padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: padding),
                  child: Center(
                    child: Text(
                      'توضیحات',
                      style: textStyle.copyWith(
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle)),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
