import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/Cv/no_cv_screen.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/PersonalInfo/personal_info_page.dart';
import 'package:gym_app/screen/ProfileApprentice/components/write_program_screen.dart';

class ProfileApprenticePage extends StatelessWidget {
  const ProfileApprenticePage({Key? key}) : super(key: key);
  static const routeName = '/ProfileApprenticePage';

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      color: kColorAppbar,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBarWidget(title: 'پروفایل شاگرد'),
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(minHeight: sizeScreen.height),
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: kBodyDecoration,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: padding, bottom: padding * 2, right: padding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: sizeScreen.width > 550 ? 30 : 20,
                        backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU'),
                      ),
                      SizedBox(
                        width: padding,
                      ),
                      RichText(
                          text: TextSpan(
                              text: 'علی کریمی',
                              style: textStyle,
                              children: [
                            TextSpan(
                                text: ' (شاگرد)',
                                style: textStyle.copyWith(
                                    color: Color(0xff5e5e5e)))
                          ])),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: kColorBackgroundItem),
                        child: Center(
                            child: SvgPicture.asset('assets/icons/trash.svg')),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'برنامه تمرینی',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          '13',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'برنامه غذایی',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          '8',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'مربیان',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          '2',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: padding * 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.of(context).pushNamed(CvPage.routeName);
                            // await NoCvScreen().noCv(context, sizeScreen);
                          },
                          child: ItemConversation(
                            image: 'assets/icons/cv.svg',
                            title: 'رزومه',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: padding,
                      ),
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: () async {
                            await WriteProgramScreen()
                                .writeProgram(context, sizeScreen);
                          },
                          child: ItemConversation(
                            image: 'assets/icons/writeProgram.svg',
                            title: 'نوشتن برنامه',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: padding,
                      ),
                      Expanded(
                        flex: 2,
                        child: ItemConversation(
                          title: 'گفتگو',
                          image: 'assets/icons/conversation.svg',
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding * 2, bottom: padding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kColorBackgroundItem),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: padding, horizontal: padding / 2),
                  child: Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/listProgram.svg',
                          ),
                          SizedBox(
                            width: padding,
                          ),
                          Text(
                            'لیست برنامه ها',
                            style: textStyle,
                          )
                        ],
                      ),
                      Spacer(),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(PersonalInfoPage.routeName);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kColorBackgroundItem),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        vertical: padding, horizontal: padding / 2),
                    child: Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/personalProfile.svg',
                            ),
                            SizedBox(
                              width: padding,
                            ),
                            Text(
                              'مشخصات فردی',
                              style: textStyle,
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding * 3, bottom: padding),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'نمودار تغییرات بدن',
                    style: textStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                ),
                ChartChageBody(sizeScreen: sizeScreen),
                Container(
                  margin: EdgeInsets.only(top: padding, bottom: padding * 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kColorBackgroundItem),
                  padding: EdgeInsets.symmetric(
                      vertical: padding, horizontal: padding / 2),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/dateBlack.svg',
                          ),
                          SizedBox(
                            width: padding,
                          ),
                          Text(
                            '21 مرداد 99',
                            style: textStyle,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: padding,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(
                                  text: 'وزن : ',
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                  text: '71 kg',
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w400),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'قد : ',
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                  text: '176 cm',
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w400),
                                )
                              ])),
                          RichText(
                              text: TextSpan(
                                  text: 'BMI : ',
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w600),
                                  children: [
                                TextSpan(
                                  text: '71 kg',
                                  style: textStyle.copyWith(
                                      fontWeight: FontWeight.w400),
                                )
                              ]))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding * 2, bottom: padding),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'گزارشگیری',
                    style: textStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: padding, horizontal: padding / 2),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kColorBackgroundItem),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'چهارشنبه',
                            style: textStyle,
                          ),
                          SizedBox(
                            width: padding / 2,
                          ),
                          Text(
                            '22/9/90',
                            style: textStyle,
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff00B4D8)),
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: SvgPicture.asset(
                          'assets/icons/dateWhite.svg',
                        )),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                      vertical: padding, horizontal: padding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kColorBackgroundItem),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ItemAttribute(
                                title: 'قد',
                                answer: '179Cm',
                              ),
                              ItemAttribute(
                                title: 'وزن',
                                answer: '76Kg',
                              ),
                            ],
                          )),
                          Spacer()
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: padding),
                        child: ItemAttribute(
                          title: 'مدت زمان تمرین',
                          answer: '62 دقیقه',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: padding),
                        child: ItemAttribute(
                          title: 'رعایت برنامه غذایی',
                          answer: '78%',
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: padding),
                        child: ItemAttribute(
                          title: 'رعایت برنامه تمرینی',
                          answer: '48%',
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: padding, bottom: padding / 2),
                        // child: RichText(
                        //     text: TextSpan(

                        //         text: 'توضیحات:',
                        //         style: textStyle.copyWith(
                        //             fontWeight: FontWeight.w700),
                        //         children: [
                        //       TextSpan(
                        //         text:
                        //             'سیب سیب یب یب سیب سیب سیبیس بسیب سیب سیبسی بسیب سیب سیبزسی بسی بیسب سیب سیب سیب سیب سیبسی بیس سثبسی بسیبسیببیسسبیب یسبیسبسیبسیبسی یسب سیبسیبسیبسی بسیبسی بسیبسیبسیبسیبسی یسبسیبسیبسیبسی بسیب سیبس',

                        //         style: textStyle.copyWith(
                        //             fontWeight: FontWeight.w500),
                        //       )
                        //     ]))
                        child: Text(
                          'توضیحات',
                          style:
                              textStyle.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        child: Text(
                          'متن توضیحات',
                          textAlign: TextAlign.justify,
                          style:
                              textStyle.copyWith(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: sizeScreen.height * 0.2,
                  margin: EdgeInsets.only(top: padding, bottom: padding),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          5,
                          (index) => Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: padding / 5),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                      'https://i.pinimg.com/474x/18/48/f5/1848f52697ad28896248b6af0839b39a.jpg'),
                                ),
                              )),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemAttribute extends StatelessWidget {
  const ItemAttribute({Key? key, required this.answer, required this.title})
      : super(key: key);
  final String title;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$title:',
          style: textStyle.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: padding / 5,
        ),
        Text(
          answer,
          style: textStyle.copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}

class ChartChageBody extends StatefulWidget {
  const ChartChageBody({
    Key? key,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;

  @override
  _ChartChageBodyState createState() => _ChartChageBodyState();
}

class _ChartChageBodyState extends State<ChartChageBody> {
  int? itemSelected;
  @override
  void initState() {
    itemSelected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            children: List.generate(
                listTime.length,
                (index) => Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            itemSelected = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: padding / 5),
                          padding: EdgeInsets.symmetric(
                              vertical: sizeScreen.width > 550
                                  ? padding
                                  : padding / 2),
                          decoration: ShapeDecoration(
                              color: itemSelected == index
                                  ? Color(0xff48CAE4)
                                  : kColorBackgroundItem,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                      color: itemSelected == index
                                          ? Color(0xff48CAE4)
                                          : Color(0xffE1E1E1),
                                      style: BorderStyle.solid))),
                          child: Center(
                            child: Text(
                              listTime[index],
                              style: textStyle.copyWith(
                                  color: itemSelected == index
                                      ? Color(0xffffffff)
                                      : Color(0xff000000)),
                            ),
                          ),
                        ),
                      ),
                    )),
          ),
          SizedBox(
            height: padding,
          ),
          Container(
            height: widget.sizeScreen.height * 0.2,
            width: double.infinity,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class ItemConversation extends StatelessWidget {
  const ItemConversation({Key? key, required this.image, required this.title})
      : super(key: key);
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: padding / 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: kColorBackgroundItem),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(image),
            SizedBox(
              width: padding / 2,
            ),
            Text(
              title,
              style: textStyle,
            )
          ],
        ));
  }
}

List<String> listTime = ['یک ماهه', 'شش ماهه', 'سال گذشته', 'همه'];
