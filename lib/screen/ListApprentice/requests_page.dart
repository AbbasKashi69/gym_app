import 'package:flutter/material.dart';
import 'package:gym_app/components/constant.dart';

import 'components/item_reject_answer.dart';
import 'list_Apprentice_page.dart';

class RequestsPage extends StatelessWidget {
  const RequestsPage({Key? key}) : super(key: key);
  static const routeName = '/requests';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: Color(0xffFBFBFB),
      // color: Color(0xffaaaaaa),
      child: Scaffold(
        appBar: AppBarWidget(
          title: 'درخواست ها',
        ),
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: padding),
          decoration: kBodyDecoration,
          child: ListView.builder(
            itemBuilder: (ctx, idx) => ItemRequest(sizeScreen: sizeScreen),
            itemCount: 20,
          ),
        ),
      ),
    );
  }
}

class ItemRequest extends StatelessWidget {
  const ItemRequest({
    Key? key,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        children: [
          Container(
            alignment: Alignment.centerRight,
            width: sizeScreen.width * 0.2,
            child: CircleAvatar(
              radius: sizeScreen.width > 550 ? 30 : 20,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg'),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: sizeScreen.width * 0.4,
            child: Text(
              'علی صدیقی منش',
              style: textStyle,
            ),
          ),
          Expanded(
              child: Row(
            children: [
              ItemRejectAnswer(
                sizeScreen: sizeScreen,
                isAnswer: false,
              ),
              SizedBox(
                width: padding,
              ),
              ItemRejectAnswer(
                sizeScreen: sizeScreen,
                isAnswer: true,
              )
            ],
          ))
        ],
      ),
    );
  }
}
