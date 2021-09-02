import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

import 'components/item_follow.dart';

class ListCoachPage extends StatelessWidget {
  const ListCoachPage({Key? key}) : super(key: key);
  static const routeName = '/ListCoachPage';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffFBFBFB),
      // color: Color(0xffaaaaaa),
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'لیست مربیان',
        ),
        backgroundColor: Colors.transparent,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: kBodyDecoration,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'مربیان',
                    style: textStyle.copyWith(
                        fontSize: kFontSizeText(sizeScreen, FontSize.title),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (ctx, idx) => ItemFollow(
                        sizeScreen: sizeScreen, data: listCoachFollow[idx]),
                    itemCount: listCoachFollow.length,
                  ),
                )
              ],
            )),
      ),
    );
  }
}

var listCoachFollow = [
  {
    'name': 'علی دهقانی',
    'followedByMe': false,
    'pic':
        'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg'
  },
  {
    'name': 'محمد سعیدی',
    'followedByMe': true,
    'pic':
        'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg'
  },
  {
    'name': 'معین کیوانی پور',
    'followedByMe': false,
    'pic':
        'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg'
  },
  {
    'name': 'رضا رمضانی',
    'followedByMe': true,
    'pic':
        'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg'
  },
];
