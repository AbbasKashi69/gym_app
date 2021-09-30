import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';

class ListBarnamehaPage extends StatefulWidget {
  const ListBarnamehaPage({Key? key}) : super(key: key);
  static const routeName = '/listBarnameha';

  @override
  _ListBarnamehaPageState createState() => _ListBarnamehaPageState();
}

class _ListBarnamehaPageState extends State<ListBarnamehaPage>
    with TickerProviderStateMixin {
  int _selectedTab = 0;
  var itemsList = [
    {
      "title": "برنامه غذایی ماه شهریور",
      "coach": "خودم",
      "type": "تمرینی",
      "status": "شروع نشده",
      "date": "00/3/23 تا 00/3/23",
      "price": "---",
    },
    {
      "title": "برنامه غذایی ماه شهریور",
      "coach": "خودم",
      "type": "تمرینی",
      "status": "شروع نشده",
      "date": "00/3/23 تا 00/3/23",
      "price": "---",
    },
    {
      "title": "برنامه غذایی ماه شهریور",
      "coach": "خودم",
      "type": "تمرینی",
      "status": "شروع نشده",
      "date": "00/3/23 تا 00/3/23",
      "price": "---",
    },
    {
      "title": "برنامه غذایی ماه شهریور",
      "coach": "خودم",
      "type": "تمرینی",
      "status": "شروع نشده",
      "date": "00/3/23 تا 00/3/23",
      "price": "---",
    },
  ];

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'لیست برنامه های خودم',
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: gw(1),
                    color: parseColor('#CAF0F8'),
                    height: 60,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                            left: _selectedTab == 1 ? 0 : gw(1) / 2.35,
                            right: _selectedTab == 0 ? 0 : gw(1) / 2.35,
                            bottom: 0,
                            top: 0,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: (gw(1) - 60) / 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            duration: const Duration(milliseconds: 300)),
                        Positioned(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTab = 0;
                              });
                            },
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              width: gw(1) / 2.35,
                              child: Text(
                                "تمرینی",
                                style: TextStyle(color: parseColor('#00B4D8')),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTab = 1;
                              });
                            },
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              width: gw(1) / 2.35,
                              child: Text(
                                "غذایی",
                                style: TextStyle(color: parseColor('#00B4D8')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                itemCount: itemsList.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: parseColor('#DBDBDB')),
                          borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: SizedBox(
                                  width: 10,
                                ),
                              ),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ConstrainedBox(
                                constraints: new BoxConstraints(
                                  minHeight: 150.0,
                                  minWidth: 3.0,
                                  maxHeight: 200.0,
                                  maxWidth: 3.0,
                                ),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: parseColor('#48CAE4'),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(itemsList[index]["title"]!),
                                    SvgPicture.asset(
                                        'assets/icons/document-copy.svg')
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("مربی : "),
                                    Text(itemsList[index]["coach"]!),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "نوع برنامه : ${itemsList[index]["type"]!}"),
                                    Text(
                                      itemsList[index]["status"]!,
                                      style: TextStyle(
                                          color: parseColor('#FFAA00'),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("تاریخ شروع و پایان :"),
                                    Text(itemsList[index]["date"]!),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text("هزینه : "),
                                    Text(itemsList[index]["price"]!),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Material(
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        onTap: () {
                                          print('ccc');
                                        },
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      parseColor('#707070'))),
                                          child: Text("مشاهده"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Material(
                                      borderRadius: BorderRadius.circular(10),
                                      child: InkWell(
                                        borderRadius: BorderRadius.circular(10),
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color:
                                                      parseColor('#707070'))),
                                          child: Text("ویرایش"),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ));
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
