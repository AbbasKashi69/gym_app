import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';

class ObserveProgramBody extends StatefulWidget {
  static const routeName = '/ObseveProgramBody';
  const ObserveProgramBody({Key? key}) : super(key: key);

  @override
  _ObserveProgramBodyState createState() => _ObserveProgramBodyState();
}

class _ObserveProgramBodyState extends State<ObserveProgramBody> {
  int itemSelectedBottomFilter = 0;
  int itemSelectedTopTurn = 0;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff48CAE4),
        body: Stack(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    height: sizeScreen.height * 0.25,
                    child: Column(
                      children: [
                        Container(
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
                        Expanded(
                          child: Container(
                              child: Column(
                            children: [
                              Spacer(),
                              SingleChildScrollView(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    children: List.generate(
                                        listTopTurn.length,
                                        (index) => TurnItem(
                                              title: listTopTurn[index]
                                                  ['titleTurn'],
                                              index: index,
                                              itemSelected: itemSelectedTopTurn,
                                              onTapTopTurn: () {
                                                setState(() {
                                                  itemSelectedTopTurn = index;
                                                });
                                              },
                                            ))),
                              ),
                            ],
                          )),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: kBodyDecoration,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: padding),
                            margin: EdgeInsets.symmetric(vertical: padding),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'حرکت',
                                      style: textStyle.copyWith(
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.title)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'ست',
                                      style: textStyle.copyWith(
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.title)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'تکرار',
                                      style: textStyle.copyWith(
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.title)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            color: Color(0xff707070),
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Expanded(
                              child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 50),
                            itemBuilder: (context, index) => LevelItemMovement(
                              data: listLevelItemMovement[index],
                            ),
                            itemCount: listLevelItemMovement.length,
                          ))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: padding),
                width: sizeScreen.width > 550
                    ? sizeScreen.width * 0.7
                    : sizeScreen.width,
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => BottomFilter(
                              onTapBottomFilter: () {
                                setState(() {
                                  itemSelectedBottomFilter = index;
                                });
                              },
                              index: index,
                              itemSelected: itemSelectedBottomFilter,
                              title: listTitleBottomFilter[index],
                            ))),
              ),
            )
          ],
        ));
  }
}

List listTopTurn = [
  {'titleTurn': 'اول'},
  {'titleTurn': 'دوم'},
  {'titleTurn': 'سوم'},
  {'titleTurn': 'چهارم'},
  {'titleTurn': 'پنجم'},
  {'titleTurn': 'ششم'},
  {'titleTurn': 'هفتم'},
  {'titleTurn': 'هشتم'},
];
List<String> listTitleBottomFilter = ['روز قبل', 'انجام دادم', 'روز بعد'];

class BottomFilter extends StatelessWidget {
  const BottomFilter(
      {Key? key,
      required this.title,
      required this.index,
      required this.onTapBottomFilter,
      required this.itemSelected})
      : super(key: key);
  final String title;
  final int index;
  final int itemSelected;
  final Function onTapBottomFilter;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTapBottomFilter();
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                itemSelected == index ? Color(0xff48CAE4) : Color(0xffCAF0F8),
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(30), left: Radius.circular(30))),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: padding),
        child: Center(
          child: Text(
            title,
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                color:
                    itemSelected == index ? Colors.white : Color(0xff0096C7)),
          ),
        ),
      ),
    );
  }
}

class LevelItemMovement extends StatelessWidget {
  const LevelItemMovement({Key? key, required this.data}) : super(key: key);
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        child: Container(
            margin: EdgeInsets.symmetric(vertical: padding),
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(color: Color(0xff48CAE4), width: 5))),
            width: double.infinity,
            child: Column(
              children: List.generate(
                data['itemsMovement'].length,
                (index) => ItemMovement(
                  data: data['itemsMovement'][index],
                ),
              ),
            )),
      ),
    );
  }
}

class ItemMovement extends StatelessWidget {
  const ItemMovement({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => Dialog(
                            shape: RoundedRectangleBorder(),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            insetAnimationDuration: Duration(seconds: 10),
                            insetAnimationCurve: Curves.decelerate,
                            child: Container(
                              width: sizeScreen.width * 0.8,
                              height: sizeScreen.height * 0.6,
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(data['pic'])),
                            )));
                  },
                  child: GestureDetector(
                      child: SvgPicture.asset(
                          'assets/icons/showImageMovementIcon.svg')),
                ),
                SizedBox(
                  width: padding,
                ),
                Text(
                  data['nameMovement'],
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  data['set'],
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                )),
          ),
          Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  data['repeat'],
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                )),
          )
        ],
      ),
    );
  }
}

class TurnItem extends StatelessWidget {
  const TurnItem({
    required this.index,
    required this.itemSelected,
    required this.onTapTopTurn,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  final int index;
  final int itemSelected;
  final Function onTapTopTurn;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        onTapTopTurn();
      },
      child: Container(
        decoration: BoxDecoration(
            color: itemSelected == index ? Colors.white : Color(0xff90E0EF),
            borderRadius: BorderRadius.horizontal(
                right: Radius.circular(30), left: Radius.circular(30))),
        margin: EdgeInsets.only(right: padding, left: padding, bottom: padding),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: padding),
        child: Center(
          child: Text(
            'نوبت $title',
            style: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                color:
                    itemSelected == index ? Color(0xff00B4D8) : Colors.white),
          ),
        ),
      ),
    );
  }
}

var listLevelItemMovement = [
  {
    'itemsMovement': [
      {
        'pic': 'https://antus.ir/wp-content/uploads/2021/07/maxresdefault.jpg',
        'nameMovement': 'لیفت کول طناب',
        'set': '3',
        'repeat': '1-5-9'
      },
      {
        'pic': 'https://antus.ir/wp-content/uploads/2021/07/1.jpg',
        'nameMovement': 'کول هالتر',
        'set': '5',
        'repeat': '1-5-7'
      },
      {
        'pic': 'https://antus.ir/wp-content/uploads/2021/06/3-3.jpg',
        'nameMovement': 'هالتر ایستادهر',
        'set': '6',
        'repeat': '2-8-3'
      }
    ],
  },
  {
    'itemsMovement': [
      {
        'pic': 'https://antus.ir/wp-content/uploads/2021/05/1-16.jpg',
        'nameMovement': 'کول دمبل',
        'set': '3',
        'repeat': '12-10-8'
      },
    ],
  },
  {
    'itemsMovement': [
      {
        'pic': 'https://antus.ir/wp-content/uploads/2021/05/7-3.jpg',
        'nameMovement': 'نشر خم با دمبل',
        'set': '3',
        'repeat': '12-10-8'
      },
      {
        'pic':
            'https://parsstock.ir/LargePhotos/10075/1148107-%D9%85%D8%B1%D8%AF-%D8%A8%D8%A7-%D9%88%D8%B2%D9%86-%D8%AA%D8%AC%D9%87%DB%8C%D8%B2%D8%A7%D8%AA-%D9%88%D8%B1%D8%B2%D8%B4%DB%8C-%D8%AF%D8%B1-%D8%A8%D8%A7%D8%B4%DA%AF%D8%A7%D9%87-%D8%A8%D8%AF%D9%86%D8%B3%D8%A7%D8%B2%DB%8C-%D9%88%D8%B1%D8%B2%D8%B4%DB%8C.jpg',
        'nameMovement': 'وزنه',
        'set': '10',
        'repeat': '12-8-3'
      }
    ],
  },
  {
    'itemsMovement': [
      {
        'pic': 'https://antus.ir/wp-content/uploads/2021/05/%DB%B1-1.jpg',
        'nameMovement': 'پرس سرشانه',
        'set': '3',
        'repeat': '12-10-8'
      },
      {
        'pic': 'https://antus.ir/wp-content/uploads/2021/05/2-9.jpg',
        'nameMovement': 'سیم کش ایستاده',
        'set': '6',
        'repeat': '9-1-3'
      },
      {
        'pic':
            'https://blog.piltanshop.com/wp-content/uploads/2018/11/1642-physical_fitness-weights-bodybuilder-human_body-exercise_equipment-350x350-1.jpg',
        'nameMovement': 'وزنه',
        'set': '10',
        'repeat': '12-8-3'
      }
    ],
  },
  {
    'itemsMovement': [
      {
        'pic': 'https://antus.ir/wp-content/uploads/2021/03/4-28.jpg',
        'nameMovement': 'جلو بازو',
        'set': '3',
        'repeat': '12-10-8'
      },
    ],
  },
];
