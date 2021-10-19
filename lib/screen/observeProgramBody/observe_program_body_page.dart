import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanType/BodyBuildingPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanTypeDetail/BodyBuildingPlanTypeDetailsFormVm.dart';
import 'package:gym_app/blocs/BodyBuildingPlanType/bloc/find_by_id_in_form_body_building_bloc.dart';
import 'package:gym_app/blocs/BodyBuildingPlantypeLog/bloc/change_current_day_body_building_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/screen/observeProgramOtherSports/components/bottom_filter.dart';
import 'package:gym_app/screen/observeProgramOtherSports/components/trun_item.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

late int dayCount;
late int termCounInDay;
late int currentDay;
late int currentTerm;
late int currentDayForSend;
late int planId;
late BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm;

class ObserveProgramBody extends StatefulWidget {
  static const routeName = '/ObseveProgramBody';
  const ObserveProgramBody({Key? key, required this.planId}) : super(key: key);
  final int planId;

  @override
  _ObserveProgramBodyState createState() => _ObserveProgramBodyState();
}

class _ObserveProgramBodyState extends State<ObserveProgramBody> {
  @override
  void initState() {
    super.initState();
    dayCount = 0;
    termCounInDay = 0;
    currentDay = 1;
    currentTerm = 1;
    currentDayForSend = 0;
    planId = widget.planId;
    bodyBuildingPlanTypeFormVm = BodyBuildingPlanTypeFormVm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff48CAE4),
        body: Container(
          child: BlocConsumer<FindByIdInFormBodyBuildingBloc,
              FindByIdInFormBodyBuildingState>(
            listener: (context, state) {
              if (state is FindByIdInFormBodyBuildingLoadedState) {
                if (state.resultObject != null &&
                    state.resultObject!.success!) {
                  bodyBuildingPlanTypeFormVm =
                      BodyBuildingPlanTypeFormVm.fromJson(
                          state.resultObject!.extra! as Map<String, dynamic>);
                  currentDay = bodyBuildingPlanTypeFormVm.currentDay!;
                  currentDayForSend = bodyBuildingPlanTypeFormVm.currentDay!;
                  dayCount = bodyBuildingPlanTypeFormVm.dayTerms!.length;
                  termCounInDay = bodyBuildingPlanTypeFormVm.dayTerms!
                      .where((element) => element.dayNumber == 1)
                      .toList()
                      .first
                      .termsCount!;
                }
              }
            },
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: state is FindByIdInFormBodyBuildingLoadingState
                    ? Center(
                        child: MyWaiting(),
                      )
                    : state is FindByIdInFormBodyBuildingLoadedState &&
                            state.resultObject != null &&
                            state.resultObject!.success!
                        ? ItemLoadedObserveBodyBuilding()
                        : state is FindByIdInFormBodyBuildingLoadedState &&
                                (state.resultObject == null ||
                                    state.resultObject!.success!)
                            ? Center(
                                child: NoData(),
                              )
                            : Container(),
              );
            },
          ),
        ));
  }
}

class ItemLoadedObserveBodyBuilding extends StatefulWidget {
  const ItemLoadedObserveBodyBuilding({Key? key}) : super(key: key);

  @override
  _ItemLoadedObserveBodyBuildingState createState() =>
      _ItemLoadedObserveBodyBuildingState();
}

class _ItemLoadedObserveBodyBuildingState
    extends State<ItemLoadedObserveBodyBuilding> {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Stack(
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
                            'مشاهده برنامه بدنسازی',
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                    termCounInDay,
                                    (index) => TurnItem(
                                          title: index != 2
                                              ? (index + 1).toString().toWord()
                                              : 'سو',
                                          index: index + 1,
                                          itemSelected: currentTerm,
                                          onTapTopTurn: () {
                                            setState(() {
                                              currentTerm = index + 1;
                                            });
                                          },
                                        ))),
                          ),
                        ],
                      )),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          top: padding, bottom: padding, right: padding),
                      child: Row(
                        children: [
                          Text(
                            'روز ${currentDay != 3 ? currentDay.toString().toWord() : 'سو'}م',
                            style: textStyle.copyWith(
                                color: Colors.white,
                                fontSize:
                                    kFontSizeText(sizeScreen, FontSize.normal)),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: kFontSizeText(sizeScreen, FontSize.subTitle),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                              'نوبت ${currentTerm != 3 ? currentTerm.toString().toWord() : 'سو'}م',
                              style: textStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.normal)))
                        ],
                      ),
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
                            bodyBuildingPlanTypeDetailsFormVm:
                                _listCurrentDayCurrentTerm()[index]),
                        itemCount: _listCurrentDayCurrentTerm().length,
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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => index == 0 && currentDay == 1
                        ? const Spacer(
                            flex: 2,
                          )
                        : index == 2 && currentDay == dayCount
                            ? const Spacer(
                                flex: 2,
                              )
                            : Expanded(
                                flex: 3,
                                child: BlocConsumer<
                                    ChangeCurrentDayBodyBuildingBloc,
                                    ChangeCurrentDayBodyBuildingState>(
                                  listener: (context, state) {
                                    if (state
                                        is ChangeCurrentDayBodyBuildingLoadedState) {
                                      if (state.resultObject != null &&
                                          state.resultObject!.success!)
                                        setState(() {
                                          currentDayForSend = currentDay;
                                        });
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state
                                            is ChangeCurrentDayBodyBuildingLoadingState &&
                                        state.index == index)
                                      return MyWaiting();
                                    else
                                      return BottomFilter(
                                        currentDay: currentDay,
                                        currentDayForSend: currentDayForSend,
                                        isDoneByMe: index == 1 ? true : false,
                                        onTapBottomFilter: () {
                                          // index == 0 it means we cklic previous day
                                          if (index == 0) {
                                            _onTapPreviousDay();
                                          }
                                          // index == 2 it means we cklic next day
                                          else if (index == 2) {
                                            _onTapNextDay();
                                          }
                                          // index != 0 and index !=2 it means we cklic on "done"
                                          else {
                                            _onTapDoneByMe(index);
                                          }
                                        },
                                        title: listTitleBottomFilter[index],
                                      );
                                  },
                                ),
                              ))),
          ),
        )
      ],
    );
  }

  void _onTapNextDay() {
    setState(() {
      currentDay += 1;
      currentTerm = 1;
      termCounInDay = bodyBuildingPlanTypeFormVm.dayTerms!
          .where((element) => element.dayNumber == currentDay)
          .toList()
          .first
          .termsCount!;
    });
  }

  void _onTapPreviousDay() {
    setState(() {
      currentDay -= 1;
      currentTerm = 1;
      termCounInDay = bodyBuildingPlanTypeFormVm.dayTerms!
          .where((element) => element.dayNumber == currentDay)
          .toList()
          .first
          .termsCount!;
    });
  }

  void _onTapDoneByMe(int index) {
    if (currentDay != currentDayForSend) {
      BlocProvider.of<ChangeCurrentDayBodyBuildingBloc>(context).add(
          ChangeCurrentDayBodyBuildingLoadingEvent(
              index: index, planId: planId, addedDay: currentDay));
    }
  }

  List<BodyBuildingPlanTypeDetailsFormVm> _listCurrentDayCurrentTerm() {
    return bodyBuildingPlanTypeFormVm.bodyBuildingPlanTypeDetails!
        .where((element) =>
            element.dayNumber == currentDay &&
            element.termNumber == currentTerm)
        .toList();
  }
}

List<String> listTitleBottomFilter = ['روز قبل', 'انجام دادم', 'روز بعد'];

class LevelItemMovement extends StatelessWidget {
  const LevelItemMovement(
      {Key? key,
      required this.data,
      required this.bodyBuildingPlanTypeDetailsFormVm})
      : super(key: key);
  final dynamic data;
  final BodyBuildingPlanTypeDetailsFormVm bodyBuildingPlanTypeDetailsFormVm;
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
            child: Column(children: [
              Column(
                children: List.generate(
                  bodyBuildingPlanTypeDetailsFormVm.superMoves!.length,
                  (index) => ItemMovement(
                    bodyBuildingPlanTypeDetailsFormVm:
                        bodyBuildingPlanTypeDetailsFormVm.superMoves![index],
                    data: data['itemsMovement'][index],
                  ),
                ),
              ),
              ItemMovement(
                bodyBuildingPlanTypeDetailsFormVm:
                    bodyBuildingPlanTypeDetailsFormVm,
                data: data['itemsMovement'][0],
              ),
            ])),
      ),
    );
  }
}

class ItemMovement extends StatelessWidget {
  const ItemMovement(
      {Key? key,
      required this.data,
      required this.bodyBuildingPlanTypeDetailsFormVm})
      : super(key: key);
  final dynamic data;
  final BodyBuildingPlanTypeDetailsFormVm bodyBuildingPlanTypeDetailsFormVm;

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
                  bodyBuildingPlanTypeDetailsFormVm.title ?? "",
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
                  bodyBuildingPlanTypeDetailsFormVm.setCount != null
                      ? bodyBuildingPlanTypeDetailsFormVm.setCount.toString()
                      : "",
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                )),
          ),
          Expanded(
            flex: 3,
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  setSetItems(),
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                )),
          )
        ],
      ),
    );
  }

  String setSetItems() {
    String helpForReturn = "";
    int mySize = bodyBuildingPlanTypeDetailsFormVm.setItems!.length;
    for (int i = 0; i < mySize; i++) {
      String x = i != mySize - 1 ? '-' : "";
      helpForReturn += '${bodyBuildingPlanTypeDetailsFormVm.setItems![i]}' + x;
    }
    return helpForReturn;
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
