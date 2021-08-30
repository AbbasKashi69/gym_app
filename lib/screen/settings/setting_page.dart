import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/settings/setting_addjob_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static const routeName = '/setting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'تنظیمات',
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
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: showDeleteBottomSheet,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("حذف حساب کاربری"),
                    SvgPicture.asset(
                      'assets/icons/trash-icon.svg',
                      height: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingAddJobPage(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.add,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("افزودن حرکت"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDeleteBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        builder: (context) => Container(
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12))),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    width: 40,
                    height: 6,
                    decoration: BoxDecoration(
                        color: parseColor('#E8E8E8'),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: SvgPicture.asset(
                      'assets/icons/empty-wallet-remove.svg',
                      width: 88,
                      height: 88,
                    ),
                  ),
                  Expanded(
                    child: Center(
                        child: Text(
                      "آیا می خواهید حساب کاربری خود را حذف کنید؟",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                    )),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                            height: 40,
                            child: Material(
                              child: Ink(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(20),
                                        right: Radius.circular(20)),
                                    gradient: LinearGradient(
                                        colors: [
                                          parseColor('#F3F3F3'),
                                          parseColor('#F3F3F3'),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  splashColor: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20),
                                      right: Radius.circular(20)),
                                  child: Container(
                                    height: Get.height * 0.07,
                                    width: Get.width * 0.8,
                                    child: Center(
                                      child: Text(
                                        "خیر",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'IRANSans',
                                        ).copyWith(
                                            fontSize: kFontSizeText(
                                                MediaQuery.of(context).size,
                                                FontSize.subTitle),
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          child: CustomeButton(
                            title: 'بله',
                            onTap: () {
                              Navigator.pop(context);
                            },
                            sizeScreen: MediaQuery.of(context).size,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  )
                ],
              ),
            )));
  }
}
