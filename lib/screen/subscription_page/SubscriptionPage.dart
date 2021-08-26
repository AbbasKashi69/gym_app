import 'dart:math';
import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customBottomBar.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({Key? key}) : super(key: key);
  static const routeName = '/subscription';

  @override
  _SubscriptionPageState createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  Random random = new Random();
  int randomNumber = 0;
  List listItems = [
    {
      'title': 'خرید اشتراک ثابت',
      'date': '00/3/23-21:43',
      'boxName': 'بسته دو ماهه',
      'price': '200,000 تومان',
      'type': 'پرداخت از اعتبار'
    },
    {
      'title': 'کاهش اشتراک',
      'date': '00/3/23-21:43',
      'boxName': 'مدت زمان : 10 روز',
      'price': '200,000 تومان',
      'type': ''
    },
    {
      'title': 'خرید اشتراک ثابت',
      'date': '00/3/23-21:43',
      'boxName': 'بسته دو ماهه',
      'price': '200,000 تومان',
      'type': 'پرداخت از اعتبار'
    },
    {
      'title': 'کاهش اشتراک',
      'date': '00/3/23-21:43',
      'boxName': 'مدت زمان : 10 روز',
      'price': '',
      'type': ''
    },
  ];

  @override
  void initState() {
    randomNumber = random.nextInt(100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomAppBarWidget(1),
        body: SingleChildScrollView(
          child: SafeArea(
              child: Container(
            width: gw(1),
            child: Column(
              children: [
                Container(
                    height: gh(0.38),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: gh(0.135),
                              width: gw(1),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25))),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: gw(1),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(25),
                                          bottomRight: Radius.circular(25)),
                                      child: Image.asset(
                                        "assets/images/appBar.png",
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: gw(1),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(25),
                                          bottomRight: Radius.circular(25)),
                                      child: Image.asset(
                                        "assets/images/background.png",
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: gh(0.025), right: gw(0.05)),
                                        child: Text(
                                          "LOGO",
                                          style: TextStyle(
                                              color:
                                                  Colors.white,
                                              fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: gh(0.025), left: gw(0.05)),
                                        child: SvgPicture.asset(
                                            "assets/icons/notification.svg",
                                            height: 30,
                                            width: 30,
                                            color:
                                                Colors.white.withOpacity(0.7)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Center(
                              child: Container(
                                height: gh(0.25),
                                margin: EdgeInsets.only(top: gh(0.1)),
                                width: gw(0.9),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Colors.white,
                                        parseColor('#ADE8F4'),
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  textDirection: TextDirection.rtl,
                                  children: [
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/icons/card-icon.svg'),
                                          Text("اشتراک کنونی :",
                                              style: textStyleSubscription),
                                          Text("دو ماهه",
                                              style: textStyleSubscription2),
                                        ],
                                      ),
                                    )),
                                    Expanded(
                                        child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          randomNumber = random.nextInt(100);
                                        });
                                      },
                                      child: CircularPercentIndicator(
                                        startAngle: 0,
                                        backgroundWidth: 12.0,
                                        backgroundColor: Colors.white,
                                        radius: 95.0,
                                        animateFromLastPercent: true,
                                        lineWidth: 12.0,
                                        animation: true,
                                        percent: (randomNumber / 100),
                                        center: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              randomNumber.toString(),
                                              style: textStyleSubscription,
                                            ),
                                            Text(
                                              "روز",
                                              style: textStyleSubscription,
                                            ),
                                          ],
                                        ),
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        progressColor: parseColor("#48CAE4"),
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
                Material(
                  color: parseColor('#0096C7'),
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {},
                    child: Container(
                      width: gw(0.9),
                      height: gh(0.23),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 58,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: parseColor('#21BEDD'),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.16)),
                                    BoxShadow(
                                      color: CupertinoColors.black
                                          .withOpacity(0.16),
                                      spreadRadius: -12.0,
                                      blurRadius: 12.0,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20))),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/wallet-icon.svg'),
                                        Text(
                                          "اعتبار شما : ",
                                          textDirection: TextDirection.rtl,
                                          style: textStyleBuySubscription2,
                                        )
                                      ],
                                    ),
                                    Text(
                                      "1,300,000 تومان",
                                      textDirection: TextDirection.rtl,
                                      style: textStyleBuySubscription2,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 42,
                            child: Center(
                              child: Text(
                                "خرید اشتراک >",
                                style: textStyleBuySubscription,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: gh(0.05)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "تاریخچه اشتراک ها",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: ListView.builder(
                    itemCount: listItems.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return item(listItems[index]);
                    },
                  ),
                )
              ],
            ),
          )),
        ));
  }

  Widget item(data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: DottedBorder(
        borderType: BorderType.RRect,
        color: parseColor('#CCCCCC'),
        dashPattern: [5],
        radius: Radius.circular(12),
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(color: parseColor('#00B4D8'), width: 3))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['title'],
                            style: TextStyle(color: parseColor('#0077B6')),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            data['boxName'],
                          ),
                          data['type'].isNotEmpty
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data['type'],
                                    ),
                                  ],
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(data['date']),
                          data['price'].isNotEmpty
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      data['price'],
                                    ),
                                  ],
                                )
                              : SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
