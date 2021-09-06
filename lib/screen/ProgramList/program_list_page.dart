import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/ProgramList/components/all_apprentice_scree.dart';
import 'package:gym_app/screen/ProgramList/components/filter_screen.dart';
import 'package:gym_app/screen/observeProgramBody/observe_program_body_page.dart';

class ProgramListPage extends StatefulWidget {
  static const routeName = '/programListPage';
  const ProgramListPage({Key? key}) : super(key: key);

  @override
  _ProgramListPageState createState() => _ProgramListPageState();
}

class _ProgramListPageState extends State<ProgramListPage> {
  bool isAlign = true;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: 'لیست برنامه ها',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: padding),
        decoration: kBodyDecoration,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: padding),
              margin: EdgeInsets.symmetric(vertical: padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: gw(0.7),
                      child: Stack(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: padding, vertical: padding / 2),
                              // constraints: BoxConstraints(maxWidth: 300),
                              // height: gh(0.07),
                              decoration: BoxDecoration(
                                  color: Color(0xffCAF0F8),
                                  borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(20),
                                    right: Radius.circular(20),
                                  )),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: padding, horizontal: 35),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isAlign = true;
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'تمرینی',
                                          style: textStyle.copyWith(
                                              color: Color(0xff00B4D8),
                                              fontSize: kFontSizeText(
                                                  sizeScreen,
                                                  FontSize.subTitle)),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isAlign = false;
                                        });
                                      },
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'غذایی',
                                          style: textStyle.copyWith(
                                              color: Color(0xff00B4D8),
                                              fontSize: kFontSizeText(
                                                  sizeScreen,
                                                  FontSize.subTitle)),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          AnimatedAlign(
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: padding / 2, horizontal: padding),
                                padding:
                                    EdgeInsets.symmetric(vertical: padding),
                                child: Center(
                                  child: Text(
                                    isAlign ? 'تمرینی' : 'غذایی',
                                    style: textStyle.copyWith(
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.subTitle),
                                        color: Color(0xff00B4D8)),
                                  ),
                                ),
                                width: 100,
                                // padding: EdgeInsets.all(padding),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(20),
                                      left: Radius.circular(20),
                                    )),
                              ),
                              alignment: isAlign
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              duration: Duration(milliseconds: 300))
                        ],
                      )),
                  InkWell(
                    onTap: () async {
                      await FilterScreen().filter(context, sizeScreen);
                    },
                    radius: 20,
                    child: Container(
                      margin: EdgeInsets.only(right: padding),
                      decoration: BoxDecoration(
                        border: Border.all(color: parseColor('#48CAE4')),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/filterListProgram.svg',
                          width: kFontSizeText(sizeScreen, FontSize.title),
                          height: kFontSizeText(sizeScreen, FontSize.title),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
              padding: EdgeInsets.only(bottom: padding),
              itemBuilder: (context, index) => ItemDietary(
                sizeScreen: sizeScreen,
                data: listItem[index],
              ),
              itemCount: listItem.length,
            )),
            // ItemDietary(sizeScreen: sizeScreen,data: ,)
          ],
        ),
      ),
    );
  }
}

class ItemDietary extends StatelessWidget {
  const ItemDietary({Key? key, required this.sizeScreen, required this.data})
      : super(key: key);

  final Size sizeScreen;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              side: BorderSide(color: Color(0xffDBDBDB)))),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: sizeScreen.width > 550 ? 5 : 2,
                height: sizeScreen.height * 0.27,
                color: Colors.blue,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(right: padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'برنامه غذایی ماه ${data['month']}',
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle),
                                  fontWeight: FontWeight.w500),
                            ),
                            SvgPicture.asset(
                              'assets/icons/moreProgramDietary.svg',
                              width: kFontSizeText(
                                    sizeScreen,
                                    FontSize.title,
                                  ) +
                                  5,
                              height: kFontSizeText(
                                    sizeScreen,
                                    FontSize.title,
                                  ) +
                                  5,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'شاگردان :',
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: padding,
                            ),
                            Container(
                              child: Stack(
                                  children: List.generate(
                                      data['apprentice'].length > 3
                                          ? 3
                                          : data['apprentice'].length,
                                      (index) => ItemRequestInStack(
                                          index: index + 1,
                                          sizeScreen: sizeScreen,
                                          image: data['apprentice'][index]))),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () async {
                                await AllApprenticeScreen()
                                    .allApprentice(context, sizeScreen, data);
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff00B4D8),
                                size: kFontSizeText(sizeScreen, FontSize.title),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'نوع برنامه : ',
                                    style: textStyle.copyWith(
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.subTitle),
                                        fontWeight: FontWeight.w500),
                                    children: [
                                  TextSpan(
                                      text: data['typeProgram'],
                                      style: textStyle.copyWith(
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.subTitle),
                                          fontWeight: FontWeight.w400))
                                ])),
                            Text(
                              data['statusTypeProgram'],
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle),
                                  color: data['statusTypeProgram'] ==
                                          'شروع نشده'
                                      ? Color(0xffFFAA00)
                                      : data['statusTypeProgram'] == 'تمام شده'
                                          ? Color(0xffFF003D)
                                          : data['statusTypeProgram'] ==
                                                  'در حال انجام'
                                              ? Color(0xff48CAE4)
                                              : Colors.black),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('تاریخ شروع و پایان :',
                                style: textStyle.copyWith(
                                    fontSize: kFontSizeText(
                                        sizeScreen, FontSize.subTitle),
                                    fontWeight: FontWeight.w500)),
                            Text('از ${data['start']} تا ${data['finish']}',
                                style: textStyle.copyWith(
                                    fontSize: kFontSizeText(
                                        sizeScreen, FontSize.subTitle),
                                    fontWeight: FontWeight.w400))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: 'هزینه : ',
                                    style: textStyle.copyWith(
                                        fontSize: kFontSizeText(
                                            sizeScreen, FontSize.subTitle),
                                        fontWeight: FontWeight.w500),
                                    children: [
                                  TextSpan(
                                      text: '${data['price']} تومان',
                                      style: textStyle.copyWith(
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.subTitle),
                                          fontWeight: FontWeight.w400))
                                ])),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(ObserveProgramBody.routeName);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Color(0xff707070))),
                    padding: EdgeInsets.symmetric(vertical: padding),
                    child: Center(
                      child: Text(
                        'مشاهده',
                        style: textStyle.copyWith(
                            fontSize:
                                kFontSizeText(sizeScreen, FontSize.subTitle)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: padding / 2,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(color: Color(0xff707070))),
                    padding: EdgeInsets.symmetric(vertical: padding),
                    child: Center(
                      child: Text(
                        'ویرایش',
                        style: textStyle.copyWith(
                            fontSize:
                                kFontSizeText(sizeScreen, FontSize.subTitle)),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class ItemRequestInStack extends StatelessWidget {
  const ItemRequestInStack(
      {Key? key,
      required this.image,
      required this.sizeScreen,
      required this.index})
      : super(key: key);

  final Size sizeScreen;
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: sizeScreen.width > 550 ? index * 35 : index * 20),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: CircleAvatar(
        radius: sizeScreen.width > 550 ? 25 : 15,
        backgroundImage: NetworkImage(image),
      ),
    );
  }
}

List listItem = [
  {
    'month': 'فروردین',
    'apprentice': [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
    ],
    'typeProgram': 'تمرینی',
    'start': '12/05/1398',
    'finish': '08/09/1399',
    'price': '320,000',
    'statusTypeProgram': 'شروع نشده'
  },
  {
    'month': 'شهریور',
    'apprentice': [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
    ],
    'typeProgram': 'مسابقه ای',
    'start': '19/08/1397',
    'finish': '17/06/1399',
    'price': '128,000',
    'statusTypeProgram': 'تمام شده'
  },
  {
    'month': 'آبان',
    'apprentice': [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
    ],
    'typeProgram': 'تمرینی',
    'start': '05/05/1395',
    'finish': '25/01/1396',
    'price': '450,000',
    'statusTypeProgram': 'در حال انجام'
  },
];
