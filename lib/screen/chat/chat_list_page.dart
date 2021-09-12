import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

import 'chat_page.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({Key? key}) : super(key: key);
  static const routeName = '/chatCategory';

  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  var itemsList = [
    {
      "name": "علی کریمی",
      "time": "18:44",
      "last_message": "سلام",
      "from": "user",
      "avatar":
          "https://s4.uupload.ir/files/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-_erz2.png",
      "new_messages": 1,
      "isRead": true
    },
    {
      "name": "علی صدیقی منش",
      "time": "18:44",
      "last_message": "سلام",
      "from": "me",
      "avatar":
          "https://s4.uupload.ir/files/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-_erz2.png",
      "new_messages": 0,
      "isRead": false
    },
    {
      "name": "علی صدیقی منش",
      "time": "18:44",
      "last_message": "سلام",
      "from": "user",
      "avatar":
          "https://s4.uupload.ir/files/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-_erz2.png",
      "new_messages": 0,
      "isRead": false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'گفتگو ها',
      ),
      floatingActionButton: Ink(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.16),
                  blurRadius: 15,
                  offset: Offset(0.0, 0.0)
              )
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [parseColor('#00B4D8'), parseColor('#48CAE4')])),
        child: InkWell(
          onTap: (){},
          child: Container(
            width: gw(0.15),
            height: gw(0.15),
            padding: EdgeInsets.all(gw(0.03)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.16),
                      blurRadius: 15,
                      offset: Offset(0.0, 0.0)
                  )
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [parseColor('#00B4D8'), parseColor('#48CAE4')])),
            child: SvgPicture.asset('assets/icons/floating-icon.svg'),
          ),
        ),
      ),
      body: Container(
        height: gh(1),
        width: gw(1),
        padding: EdgeInsets.symmetric(horizontal: gw(0.05)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    hintText: 'جستجوی گفتگوها',
                    hintStyle: TextStyle(color: parseColor('#9D9D9D')),
                    suffixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 30,
                    ),
                    suffixStyle: const TextStyle(color: Colors.green)),
              ),
              SizedBox(
                height: 30,
              ),
              ListView.builder(
                itemCount: itemsList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatPage(),
                            ));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        width: gw(1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 15,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.network(
                                  itemsList[index]['avatar'].toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 85,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  itemsList[index]['name']
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: kFontSizeText(
                                                          MediaQuery.of(context)
                                                              .size,
                                                          FontSize.title),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                if (int.parse(itemsList[index]
                                                            ['new_messages']
                                                        .toString()) !=
                                                    0)
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 7),
                                                    child: SizedBox(
                                                      width: 25,
                                                      height: 25,
                                                      child: CircleAvatar(
                                                          backgroundColor:
                                                              parseColor(
                                                                  '#48CAE4'),
                                                          child: Text(
                                                            itemsList[index][
                                                                    'new_messages']
                                                                .toString(),
                                                            textDirection:
                                                                TextDirection
                                                                    .ltr,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          )),
                                                    ),
                                                  )
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                if (itemsList[index]['from']
                                                        .toString() ==
                                                    "me")
                                                  Text(
                                                    "شما : ",
                                                    style: TextStyle(
                                                        color: parseColor(
                                                            '#8F8F8F'),
                                                        fontSize: kFontSizeText(
                                                            MediaQuery.of(
                                                                    context)
                                                                .size,
                                                            FontSize.subTitle)),
                                                  ),
                                                Text(
                                                  itemsList[index]
                                                          ['last_message']
                                                      .toString(),
                                                  style: TextStyle(
                                                      color:
                                                          parseColor('#8F8F8F'),
                                                      fontSize: kFontSizeText(
                                                          MediaQuery.of(context)
                                                              .size,
                                                          FontSize.subTitle)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            if (itemsList[index]['from']
                                                    .toString() !=
                                                "me")
                                              if (itemsList[index]
                                                      ['isRead'] as bool ==
                                                  true)
                                                SvgPicture.asset(
                                                    'assets/icons/double-tick-icon.svg')
                                              else
                                                SvgPicture.asset(
                                                    'assets/icons/tick-icon.svg'),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              itemsList[index]['time']
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: kFontSizeText(
                                                      MediaQuery.of(context)
                                                          .size,
                                                      FontSize.normal),
                                                  color: parseColor('#8F8F8F')),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
