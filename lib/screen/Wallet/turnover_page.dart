import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class TurnoverPage extends StatefulWidget {
  const TurnoverPage({Key? key}) : super(key: key);

  @override
  _TurnoverPageState createState() => _TurnoverPageState();
}

class _TurnoverPageState extends State<TurnoverPage> {
  bool onClick = false;
  List<bool> _listChecked = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialChecked();
  }

  void initialChecked() {
    _listChecked.add(false);
    _listChecked.add(false);
    _listChecked.add(false);
    _listChecked.add(true);
    _listChecked.add(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        toolbarHeight: Get.height * 0.08,
        actions: [
          Container(
            width: Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "گزارش مالی",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Get.height * 0.0225,
                        fontFamily: 'IRANSans',
                        fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                        "assets/icons/vuesax-linear-arrow-square-left.svg"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Container(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.025, vertical: Get.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "گردش مالی",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "IRANSans",
                    fontSize: Get.height * 0.0275),
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              Container(
                width: Get.width,
                height: Get.height * 0.075,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _listChecked[0] = true;
                          _listChecked[1] = false;
                          _listChecked[2] = false;
                          _listChecked[3] = false;
                          _listChecked[4] = false;
                        });
                      },
                      child: AnimatedContainer(
                        width: Get.width * 0.35,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: _listChecked[0]
                              ? Colors.grey[300]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "ورودی ها",
                            style: TextStyle(
                                color: _listChecked[0]
                                    ? Colors.black
                                    : Colors.black45,
                                fontSize: Get.height * 0.022,
                                fontFamily: "IRANSans"),
                          ),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _listChecked[0] = false;
                          _listChecked[1] = true;
                          _listChecked[2] = false;
                          _listChecked[3] = false;
                          _listChecked[4] = false;
                        });
                      },
                      child: AnimatedContainer(
                        width: Get.width * 0.35,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: _listChecked[1]
                              ? Colors.grey[300]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "واریز ها",
                            style: TextStyle(
                                color: _listChecked[1]
                                    ? Colors.black
                                    : Colors.black45,
                                fontSize: Get.height * 0.022,
                                fontFamily: "IRANSans"),
                          ),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _listChecked[0] = false;
                          _listChecked[1] = false;
                          _listChecked[2] = true;
                          _listChecked[3] = false;
                          _listChecked[4] = false;
                        });
                      },
                      child: AnimatedContainer(
                        width: Get.width * 0.6,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: _listChecked[2]
                              ? Colors.grey[300]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "انتقال به کیف پول دیگران",
                            style: TextStyle(
                                color: _listChecked[2]
                                    ? Colors.black
                                    : Colors.black45,
                                fontSize: Get.height * 0.022,
                                fontFamily: "IRANSans"),
                          ),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _listChecked[0] = false;
                          _listChecked[1] = false;
                          _listChecked[2] = false;
                          _listChecked[3] = true;
                        });
                      },
                      child: AnimatedContainer(
                        width: Get.width * 0.6,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: _listChecked[3]
                              ? Colors.grey[300]
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "انتقال به حساب بانکی",
                            style: TextStyle(
                                color: _listChecked[3]
                                    ? Colors.black
                                    : Colors.black45,
                                fontSize: Get.height * 0.022,
                                fontFamily: "IRANSans"),
                          ),
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.035,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(12),
                padding: EdgeInsets.all(6),
                color: Colors.grey,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: Get.height  * 0.15,
                    width: Get.width,

                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
