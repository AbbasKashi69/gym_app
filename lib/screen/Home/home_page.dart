import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customBottomBar.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/Elanha/elan_page.dart';
import 'package:gym_app/screen/ListCoach/list_coach_page.dart';
import 'package:gym_app/screen/ProgramList/program_list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Container(
        width: Get.width,
        child: Column(
          children: [
            Container(
                height: Get.height * 0.5,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Get.height * 0.135,
                          width: Get.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(25),
                                  bottomLeft: Radius.circular(25))),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: Get.width,
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
                                width: Get.width,
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
                                        bottom: Get.height * 0.025,
                                        right: Get.width * 0.05),
                                    child: Text(
                                      "LOGO",
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 20),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: Get.height * 0.025,
                                        left: Get.width * 0.05),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(ElanPage.routeName);
                                      },
                                      child: SvgPicture.asset(
                                          "assets/icons/notification.svg",
                                          height: 30,
                                          width: 30,
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            height: Get.height * 0.2,
                            margin: EdgeInsets.only(top: Get.height * 0.1),
                            width: Get.width * 0.9,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/item-slider-home.png"),
                                  fit: BoxFit.fitWidth,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.015,
                    ),
                    Container(
                      height: Get.height * 0.12,
                      width: Get.width * 0.9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/background-home-item.png"),
                              fit: BoxFit.fitWidth),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          SvgPicture.asset(
                              "assets/icons/vuesax-bold-money-4.svg",
                              height: Get.height * 0.065),
                          Spacer(),
                          Text("اشتراک کنونی :", style: textStyleHome),
                          Spacer(),
                          Text("دو ماهه", style: textStyleHome),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            padding: EdgeInsets.only(),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProgramListPage.routeName);
                  },
                  child: ItemWidget(
                    title: "لیست  \n برنامه ها ",
                    pic: "assets/icons/vuesax-linear-clipboard-tick.svg",
                  ),
                ),
                ItemWidget(
                  title: "گفنگوها",
                  pic: "assets/icons/vuesax-linear-message-text.svg",
                ),
                ItemWidget(
                  title: "برنامه های \n فعال ",
                  pic: "assets/icons/clipboard.svg",
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ItemWidget(
                  title: "ایجاد برنامه\n غذایی",
                  pic: "assets/icons/vuesax-linear-reserve.svg",
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CreateProgramBodyPage.routeName);
                  },
                  child: ItemWidget(
                    title: "ایجاد برنامه\n بدنسازی",
                    pic: "assets/icons/vuesax-linear-weight.svg",
                  ),
                ),
                ItemWidget(
                  title: "ایجاد برنامه\n سایر رشته",
                  pic: "assets/icons/vuesax-linear-clipboard-text.svg",
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ListCoachPage.routeName);
                  },
                  child: ItemWidget(
                    title: "مربیان \n مشاهده",
                    pic: "assets/icons/user-octagon.svg",
                  ),
                ),
                ItemWidget(
                  title: "تنظیمات",
                  pic: "assets/icons/setting-2.svg",
                ),
                Container(
                  height: Get.height * 0.13,
                  width: Get.width * 0.26,
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      )),
    ));
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    Key? key,
    required this.pic,
    required this.title,
  }) : super(key: key);
  final String pic;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.13,
      width: Get.width * 0.26,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 5,
                offset: Offset(1, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            pic,
            height: 30,
            width: 30,
          ),
          Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: "IRANSans",
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
