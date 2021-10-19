import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/AnonymousPlanTypeDetail/AnonymousPlanTypeDetailFormVm.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/DietPlanTypeDetail/DietPlanTypeDetailFormVm.dart';
import 'package:gym_app/blocs/AnonymousPlanType/bloc/find_by_id_in_form_other_sports_bloc.dart';
import 'package:gym_app/blocs/AnonymousPlanTypeLog/bloc/change_current_day_bloc.dart';
import 'package:gym_app/blocs/DietPlanType/bloc/find_by_id_in_form_diet_bloc.dart';
import 'package:gym_app/blocs/DietPlanTypeLog/bloc/change_current_day_diet_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/screen/observeProgramOtherSports/components/bottom_filter.dart';
import 'package:gym_app/screen/observeProgramOtherSports/components/item_other_sport.dart';
import 'package:gym_app/screen/observeProgramOtherSports/components/trun_item.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

late int dayCount;
late int termCounInDay;
late int currentDay;
late int currentTerm;
late int currentDayForSend;
late int planId;
late DietPlanTypeFormVm dietPlanTypeFormVm;

class ObserveProgramDietPage extends StatefulWidget {
  static const routeName = '/ObserveProgramDietPage';
  ObserveProgramDietPage({Key? key, required this.planId}) : super(key: key);
  final int planId;

  @override
  _ObserveProgramDietPageState createState() => _ObserveProgramDietPageState();
}

class _ObserveProgramDietPageState extends State<ObserveProgramDietPage> {
  @override
  void initState() {
    super.initState();
    dayCount = 0;
    termCounInDay = 0;
    currentDay = 1;
    currentTerm = 1;
    currentDayForSend = 0;
    planId = widget.planId;
    dietPlanTypeFormVm = DietPlanTypeFormVm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff48CAE4),
        body: Container(
          child: BlocConsumer<FindByIdInFormDietBloc, FindByIdInFormDietState>(
            listener: (context, state) {
              if (state is FindByIdInFormDietLoadedState) {
                if (state.resultObject != null &&
                    state.resultObject!.success!) {
                  dietPlanTypeFormVm = DietPlanTypeFormVm.fromJson(
                      state.resultObject!.extra! as Map<String, dynamic>);
                  currentDay = dietPlanTypeFormVm.currentDay!;
                  currentDayForSend = dietPlanTypeFormVm.currentDay!;
                  dayCount = dietPlanTypeFormVm.dayMeals!.length;
                  termCounInDay = dietPlanTypeFormVm.dayMeals!
                      .where((element) => element.dayNumber == 1)
                      .toList()
                      .first
                      .mealsCount!;
                }
              }
            },
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: state is FindByIdInFormDietLoadingState
                    ? Center(
                        child: MyWaiting(),
                      )
                    : state is FindByIdInFormDietLoadedState &&
                            state.resultObject != null &&
                            state.resultObject!.success!
                        ? ItemLoadedObserveDiet()
                        : state is FindByIdInFormDietLoadedState &&
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

List<String> listTitleBottomFilter = ['روز قبل', 'انجام دادم', 'روز بعد'];

class ItemLoadedObserveDiet extends StatefulWidget {
  const ItemLoadedObserveDiet({
    Key? key,
  }) : super(key: key);

  @override
  _ItemLoadedObserveDietState createState() => _ItemLoadedObserveDietState();
}

class _ItemLoadedObserveDietState extends State<ItemLoadedObserveDiet> {
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
                            'مشاهده ی برنامه غذایی',
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
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'وعده',
                                style: textStyle.copyWith(
                                    fontSize: kFontSizeText(
                                        sizeScreen, FontSize.title)),
                              ),
                            ),
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
                              itemBuilder: (context, index) =>
                                  ItemDescriptionMovement(
                                    description:
                                        _listCurrentDayCurrentTerm()[index]
                                            .description,
                                    title: _listCurrentDayCurrentTerm()[index]
                                        .title,
                                  ),
                              itemCount: _listCurrentDayCurrentTerm().length))
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
                                child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: BlocConsumer<
                                        ChangeCurrentDayDietBloc,
                                        ChangeCurrentDayDietState>(
                                      listener: (context, state) {
                                        if (state
                                            is ChangeCurrentDayDietLoadedState) {
                                          if (state.resultObject != null &&
                                              state.resultObject!.success!)
                                            setState(() {
                                              currentDayForSend = currentDay;
                                            });
                                        }
                                      },
                                      builder: (context, state) {
                                        if (state
                                                is ChangeCurrentDayDietLoadingState &&
                                            state.index == index)
                                          return MyWaiting();
                                        else
                                          return BottomFilter(
                                            currentDay: currentDay,
                                            currentDayForSend:
                                                currentDayForSend,
                                            isDoneByMe:
                                                index == 1 ? true : false,
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
                                    )),
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
      termCounInDay = dietPlanTypeFormVm.dayMeals!
          .where((element) => element.dayNumber == currentDay)
          .toList()
          .first
          .mealsCount!;
    });
  }

  void _onTapPreviousDay() {
    setState(() {
      currentDay -= 1;
      currentTerm = 1;
      termCounInDay = dietPlanTypeFormVm.dayMeals!
          .where((element) => element.dayNumber == currentDay)
          .toList()
          .first
          .mealsCount!;
    });
  }

  void _onTapDoneByMe(int index) {
    if (currentDay != currentDayForSend) {
      BlocProvider.of<ChangeCurrentDayDietBloc>(context).add(
          ChangeCurrentDayDietLoadingEvent(
              index: index, planId: planId, addedDay: currentDay));
    }
  }

  List<DietPlanTypeDetailFormVm> _listCurrentDayCurrentTerm() {
    return dietPlanTypeFormVm.dietPlanTypeDetailForms!
        .where((element) =>
            element.dayNumber == currentDay &&
            element.mealNumber == currentTerm)
        .toList();
  }
}
