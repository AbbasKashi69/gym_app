import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/PlanTypeLogVm.dart';
import 'package:gym_app/blocs/PlanType/bloc/get_plans_by_sort_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/components/set_selected_route.dart';
import 'package:gym_app/extensions/ext.dart';

class MyActiveProgramPage extends StatefulWidget {
  const MyActiveProgramPage({Key? key}) : super(key: key);
  static const routeName = '/myActiveProgramPage';

  @override
  _MyActiveProgramPageState createState() => _MyActiveProgramPageState();
}

class _MyActiveProgramPageState extends State<MyActiveProgramPage>
    with TickerProviderStateMixin {
  int _selectedTab = 0;
  late ScrollController _exerciseScrollController;
  late ScrollController _dietScrollController;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, keepPage: true);
    _exerciseScrollController = ScrollController()..addListener(_listener);
    _dietScrollController = ScrollController()..addListener(_listenerDiet);
    super.initState();
  }

  _listener() {
    if (_exerciseScrollController.position.pixels ==
        _exerciseScrollController.position.maxScrollExtent) {
      BlocProvider.of<GetPlansBySortBloc>(context)
        ..add(GetPlansBySortLoadedEvent(
          planType: 4,
          planStatusList: '1',
          setCoachId: false,
          setStudentId: true,
        ));
    }
  }

  _listenerDiet() {
    if (_dietScrollController.position.pixels ==
        _dietScrollController.position.maxScrollExtent) {
      BlocProvider.of<GetPlansBySortBloc>(context)
        ..add(GetPlansBySortLoadedEvent(
          planType: 2,
          planStatusList: '1',
          setCoachId: false,
          setStudentId: true,
        ));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    _exerciseScrollController.dispose();
    _dietScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'لیست برنامه های فعال',
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
          controller: _selectedTab == 0
              ? _exerciseScrollController
              : _dietScrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Container(
                    width: gw(1),
                    color: parseColor('#CAF0F8'),
                    height: 60,
                    child: Stack(
                      children: [
                        AnimatedPositioned(
                            left: _selectedTab == 1 ? 0 : gw(1) / 2.35,
                            right: _selectedTab == 0 ? 0 : gw(1) / 2.35,
                            bottom: 0,
                            top: 0,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: (gw(1) - 60) / 2,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            duration: const Duration(milliseconds: 300)),
                        Positioned(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTab = 0;
                              });
                              BlocProvider.of<GetPlansBySortBloc>(context).add(
                                  GetPlansBySortLoadingEvent(
                                      setCoachId: false,
                                      setStudentId: true,
                                      planType: 4,
                                      planStatusList: '1'));
                            },
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              width: gw(1) / 2.35,
                              child: Text(
                                "تمرینی",
                                style: TextStyle(color: parseColor('#00B4D8')),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedTab = 1;
                              });
                              BlocProvider.of<GetPlansBySortBloc>(context).add(
                                  GetPlansBySortLoadingEvent(
                                      setCoachId: false,
                                      setStudentId: true,
                                      planType: 2,
                                      planStatusList: '1'));
                            },
                            child: Container(
                              height: 60,
                              alignment: Alignment.center,
                              width: gw(1) / 2.35,
                              child: Text(
                                "غذایی",
                                style: TextStyle(color: parseColor('#00B4D8')),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              BlocBuilder<GetPlansBySortBloc, GetPlansBySortState>(
                builder: (context, state) => AnimatedSwitcher(
                  duration: Duration(milliseconds: 1000),
                  switchInCurve: Curves.easeIn,
                  child: state is GetPlansBySortLoadingState
                      ? Center(child: MyWaiting())
                      : state is GetPlansBySortLoadedState &&
                              state.page_planTypeLogVm != null &&
                              state.page_planTypeLogVm!.items != null &&
                              state.page_planTypeLogVm!.items!.isNotEmpty
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (index <
                                    state.page_planTypeLogVm!.items!.length)
                                  return ItemLoadedActiveProgram(
                                      planTypeLogvm: state
                                          .page_planTypeLogVm!.items![index]);
                                else
                                  return MyWaiting();
                              },
                              itemCount: state.page_planTypeLogVm!.hasNext!
                                  ? state.page_planTypeLogVm!.items!.length + 1
                                  : state.page_planTypeLogVm!.items!.length,
                            )
                          : state is GetPlansBySortLoadedState &&
                                  (state.page_planTypeLogVm == null ||
                                      state.page_planTypeLogVm!.items == null ||
                                      state.page_planTypeLogVm!.items!.isEmpty)
                              ? NoData()
                              : Container(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemLoadedActiveProgram extends StatelessWidget {
  const ItemLoadedActiveProgram({Key? key, required this.planTypeLogvm})
      : super(key: key);
  final PlanTypeLogvm planTypeLogvm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: parseColor('#DBDBDB')),
          borderRadius: BorderRadius.circular(8)),
      child: Container(
        padding: EdgeInsets.only(top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: SizedBox(
                  width: 10,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: 150.0,
                  minWidth: 3.0,
                  maxHeight: 200.0,
                  maxWidth: 3.0,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: parseColor('#48CAE4'),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(planTypeLogvm.planTypeTitle ?? ""),
                    SvgPicture.asset('assets/icons/document-copy.svg')
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("مربی : "),
                    Text(CurrentUserVm.roleType == 3
                        ? planTypeLogvm.userFullName ?? ""
                        : planTypeLogvm.planTypeCoachFullName ?? ""),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("نوع برنامه : ${planTypeLogvm.nPlanType}"),
                    Text(
                      planTypeLogvm.nPlanStatus ?? "",
                      style: textStyle.copyWith(
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle),
                          color: planTypeLogvm.nPlanStatus == 'شروع نشده'
                              ? Color(0xffFFAA00)
                              : planTypeLogvm.nPlanStatus == 'تمام شده'
                                  ? Color(0xff01D43F)
                                  : planTypeLogvm.nPlanStatus == 'در حال انجام'
                                      ? Color(0xff48CAE4)
                                      : Color(0xffFF003D)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('تاریخ شروع و پایان :',
                        style: textStyle.copyWith(
                            fontSize:
                                kFontSizeText(sizeScreen, FontSize.subTitle),
                            fontWeight: FontWeight.w500)),
                    Text(
                        '${planTypeLogvm.nStartDate} تا ${planTypeLogvm.nEndDate}',
                        style: textStyle.copyWith(
                            fontSize:
                                kFontSizeText(sizeScreen, FontSize.subTitle),
                            fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
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
                              text: '${planTypeLogvm.nTotalPrice} تومان',
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle),
                                  fontWeight: FontWeight.w400))
                        ])),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          print('ccc');
                        },
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: parseColor('#707070'))),
                          child: Text("مشاهده"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          SetSelectedRoute()
                            ..setSelectedRoute(context, planTypeLogvm.planType,
                                planTypeLogvm.planTypeId);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: parseColor('#707070'))),
                          child: Text("ویرایش"),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            )),
            SizedBox(
              width: 8,
            )
          ],
        ),
      ),
    );
  }
}
