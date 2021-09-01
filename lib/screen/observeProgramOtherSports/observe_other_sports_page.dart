import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'components/bottom_filter.dart';
import 'components/item_other_sport.dart';
import 'components/trun_item.dart';

class ObserveOtherSportsPage extends StatefulWidget {
  static const routeName = '/ObserveOtherSportsPage';
  const ObserveOtherSportsPage({Key? key}) : super(key: key);

  @override
  _ObserveOtherSportsPageState createState() => _ObserveOtherSportsPageState();
}

class _ObserveOtherSportsPageState extends State<ObserveOtherSportsPage> {
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
                            itemBuilder: (context, index) => ItemOtherSport(
                                data: listItemOtherSportVm[index]),
                            itemCount: listItemOtherSportVm.length,
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

var listItemOtherSportVm = [
  {
    'name': 'طناب زنی',
    'description':
        ' طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود vطناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود v طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود'
  },
  {
    'name': 'طناب زنی',
    'description':
        'طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود'
  },
  {
    'name': 'طناب زنی',
    'description':
        'طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود'
  },
  {
    'name': 'طناب زنی',
    'description':
        'طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود'
  },
  {
    'name': 'طناب زنی',
    'description':
        'طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود'
  },
  {
    'name': 'طناب زنی',
    'description':
        'طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود'
  },
  {
    'name': 'طناب زنی',
    'description':
        'طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود'
  },
  {
    'name': 'طناب زنی',
    'description':
        'طناب زدن باعث کاهش وزن می شود روزی نیم ساعت طناب زدن مداوم باعث سلامتی افراد میشود'
  },
];
