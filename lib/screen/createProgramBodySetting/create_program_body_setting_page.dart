import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';

class CreateProgramBodySettingPage extends StatelessWidget {
  static const routeName = '/CreateProgramBodySettingPage';
  CreateProgramBodySettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff48CAE4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sizeScreen.height * 0.25,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ایجاد برنامه بدنسازی',
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
                                color: Colors.white),
                          ),
                          GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: SvgPicture.asset(
                                'assets/icons/backIcon.svg',
                                width: sizeScreen.width > 550 ? 40 : 25,
                                height: sizeScreen.width > 550 ? 40 : 25,
                                color: Colors.white,
                              )
                              // child: Container(),
                              )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(40),
                                left: Radius.circular(40))),
                        width: sizeScreen.width * 0.7,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Color(0xff00B4D8),
                                ),
                                SizedBox(
                                  width: padding,
                                ),
                                Text(
                                  'تنظیمات',
                                  style: textStyle.copyWith(
                                      fontSize: kFontSizeText(
                                          sizeScreen, FontSize.title),
                                      color: Color(0xff00B4D8)),
                                )
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff00B4D8),
                                  size:
                                      kFontSizeText(sizeScreen, FontSize.title),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            DaysTask(sizeScreen: sizeScreen)
          ],
        ),
      ),
    );
  }
}

var listData = [
  {'day': 'اول'},
  {'day': 'دوم'},
  {'day': 'سوم'},
];

class DaysTask extends StatefulWidget {
  const DaysTask({
    Key? key,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;

  @override
  _DaysTaskState createState() => _DaysTaskState();
}

class _DaysTaskState extends State<DaysTask> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: widget.sizeScreen.height * 0.75),
      width: double.infinity,
      decoration: kBodyDecoration,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: widget.sizeScreen.width > 550
              ? widget.sizeScreen.width * 0.7
              : widget.sizeScreen.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 40),
                child: Text(
                  'روز ها',
                  style: textStyle.copyWith(
                    fontSize: kFontSizeText(widget.sizeScreen, FontSize.title),
                  ),
                ),
              ),
              Column(
                children: List.generate(
                    listData.length,
                    (index) => ItemDay(
                          title: listData[index]['day']!,
                          deleteItem: () {
                            setState(() {
                              listData.removeAt(index);
                            });
                          },
                        )),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    listData.add({'day': intToString(listData.length + 1)});
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: padding),
                  height: widget.sizeScreen.height * 0.07,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: Color(0xff00B4D8),
                    dashPattern: [5],
                    radius: Radius.elliptical(20, 20),
                    child: Container(
                      // width: gw(0.8),
                      // height: gh(0.03),
                      child: Center(
                        child: Text(
                          'روز جدید',
                          style: textStyle.copyWith(
                              fontSize: kFontSizeText(
                                  widget.sizeScreen, FontSize.subTitle),
                              color: Color(0xff00B4D8)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CustomeButton(
                  sizeScreen: widget.sizeScreen,
                  title: "ثبت",
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CreateMovementPage.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  String intToString(int index) {
    switch (index) {
      case 1:
        return 'اول';
      case 2:
        return 'دوم';
      case 3:
        return 'سوم';
      case 4:
        return 'چهارم';
      case 5:
        return 'پنجم';
      case 6:
        return 'ششم';
      case 7:
        return 'هفتم';
      case 8:
        return 'هشتم';
      case 9:
        return 'نهم';
      case 10:
        return 'دهم';
      case 11:
        return 'یازدهم';
      case 12:
        return 'دوازدهم';
      case 13:
        return 'سیزدهم';
      case 14:
        return 'چهاردهم';
      case 15:
        return 'پانزدهم';
      case 16:
        return 'شانزدهم';
      case 17:
        return 'هفدهم';
      case 18:
        return 'هجدهم';
      case 19:
        return 'نوزدهم';
      case 20:
        return 'بیستم';
      case 21:
        return 'بیست و یکم';
      case 22:
        return 'بیست و دوم';
      case 23:
        return 'بیست و سوم';
      case 24:
        return 'بیست و چهارم';
      case 25:
        return 'بیست و پنجم';
      case 26:
        return 'بیست و ششم';
      case 27:
        return 'بیست و هفتم';
      case 28:
        return 'بیست و هشتم';
      case 29:
        return 'بیست و نهم';
      case 30:
        return 'سی ام';
      case 31:
        return 'سی و یکم';
      default:
        return 'دهم';
    }
  }
}

class ItemDay extends StatelessWidget {
  const ItemDay({
    Key? key,
    required this.deleteItem,
    required this.title,
  }) : super(key: key);
  final String title;
  final Function deleteItem;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'روز $title',
            style: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
            ),
          ),
          GestureDetector(
            onTap: () {
              deleteItem();
            },
            child: SvgPicture.asset(
              'assets/icons/trash.svg',
              width: kFontSizeText(sizeScreen, FontSize.title) + 8,
              height: kFontSizeText(sizeScreen, FontSize.title) + 8,
            ),
          )
        ],
      ),
    );
  }
}
