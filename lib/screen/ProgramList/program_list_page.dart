import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';

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
      body: SingleChildScrollView(
        child: Container(
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
                                      vertical: padding / 2,
                                      horizontal: padding),
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
                    Container(
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
                    )
                  ],
                ),
              ),
              ItemDietary(sizeScreen: sizeScreen)
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDietary extends StatelessWidget {
  const ItemDietary({
    Key? key,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;

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
                              'برنامه غذایی ماه شهریور',
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
                                      listItemRequestInStackVm.length,
                                      (index) => ItemRequestInStack(
                                          sizeScreen: sizeScreen,
                                          itemRequestInStackVm:
                                              listItemRequestInStackVm[
                                                  index]))),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff00B4D8),
                              size: kFontSizeText(sizeScreen, FontSize.title),
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
                                      text: 'تمرینی',
                                      style: textStyle.copyWith(
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.subTitle),
                                          fontWeight: FontWeight.w400))
                                ])),
                            Text(
                              'شروع نشده',
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle),
                                  color: Color(0xffFFAA00)),
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
                            Text('از 20/05/1399 تا 09/12/1400',
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
                                      text: '370،000 تومان',
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
                    onPressed: () {},
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

class ItemRequestInStackVm {
  final String? image;
  final double marginRight;
  ItemRequestInStackVm({this.image, this.marginRight = 1});
}

// bottom source code is fake and Repetitious in list apprentice but you don't delete that. becouse i need it
List<ItemRequestInStackVm> listItemRequestInStackVm = [
  ItemRequestInStackVm(
    image:
        'https://i.pinimg.com/474x/18/48/f5/1848f52697ad28896248b6af0839b39a.jpg',
  ),
  ItemRequestInStackVm(
      image:
          'https://i.pinimg.com/564x/5b/40/87/5b4087d0fc8d9d372c00a32bc08f818c.jpg',
      marginRight: 25),
  ItemRequestInStackVm(
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRiLA28J7m4Jbacks8ceGZoQC-QgRLqbje9nA&usqp=CAU',
      marginRight: 50),
];
// bottom source code is fake and Repetitious in list apprentice but you don't delete that. becouse i need it

class ItemRequestInStack extends StatelessWidget {
  const ItemRequestInStack({
    Key? key,
    required this.itemRequestInStackVm,
    required this.sizeScreen,
  }) : super(key: key);

  final Size sizeScreen;
  final ItemRequestInStackVm itemRequestInStackVm;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: itemRequestInStackVm.marginRight),
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: CircleAvatar(
        radius: sizeScreen.width > 550 ? 25 : 15,
        backgroundImage: NetworkImage(itemRequestInStackVm.image!),
      ),
    );
  }
}
