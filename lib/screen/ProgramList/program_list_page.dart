import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/PlanTypeLogVm.dart';
import 'package:gym_app/blocs/PlanType/bloc/get_plans_by_sort_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/ProgramList/components/filter_screen.dart';
import 'package:gym_app/screen/observeProgramBody/observe_program_body_page.dart';

class ProgramListPage extends StatefulWidget {
  static const routeName = '/programListPage';
  const ProgramListPage({Key? key}) : super(key: key);

  @override
  _ProgramListPageState createState() => _ProgramListPageState();
}

class _ProgramListPageState extends State<ProgramListPage> {
  late bool isAlign;
  late ScrollController _exerciseScrollController;
  late ScrollController _dietScrollController;
  late TextEditingController searchTextEditingController;
  int? coachId;
  int? studentId;
  int? planTypeId;
  String? planStatusList;
  String? searchText;
  bool? setCoachId;
  bool? setStudentId;
  @override
  void initState() {
    isAlign = true;
    _exerciseScrollController = ScrollController()..addListener(_listener);
    _dietScrollController = ScrollController()..addListener(_listenerDiet);
    searchTextEditingController = TextEditingController();
    super.initState();
  }

  _listener() {
    if (_exerciseScrollController.position.pixels ==
        _exerciseScrollController.position.maxScrollExtent) {
      BlocProvider.of<GetPlansBySortBloc>(context)
        ..add(GetPlansBySortLoadedEvent(planType: 4));
    }
  }

  _listenerDiet() {
    if (_dietScrollController.position.pixels ==
        _dietScrollController.position.maxScrollExtent) {
      BlocProvider.of<GetPlansBySortBloc>(context)
        ..add(GetPlansBySortLoadedEvent(planType: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: 'لیست برنامه ها',
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
          controller:
              isAlign ? _exerciseScrollController : _dietScrollController,
          physics: const BouncingScrollPhysics(),
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
                                          planTypeId = 4;
                                          BlocProvider.of<GetPlansBySortBloc>(
                                                  context)
                                              .add(GetPlansBySortLoadingEvent(
                                            planType: planTypeId,
                                            coachId: coachId,
                                            studentId: studentId,
                                            planStatusList: planStatusList,
                                            searchText: searchText,
                                            setCoachId: setCoachId,
                                            setStudentId: setStudentId,
                                          ));
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
                                          planTypeId = 2;
                                          BlocProvider.of<GetPlansBySortBloc>(
                                                  context)
                                              .add(GetPlansBySortLoadingEvent(
                                                  planType: planTypeId,
                                                  coachId: coachId,
                                                  studentId: studentId,
                                                  planStatusList:
                                                      planStatusList,
                                                  searchText: searchText,
                                                  setCoachId: setCoachId,
                                                  setStudentId: setStudentId));
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
                    InkWell(
                      onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          elevation: 20,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (ctx) => BlocProvider.value(
                                value: BlocProvider.of<GetPlansBySortBloc>(
                                    context),
                                child: FilterScreen(
                                  sizeScreen: sizeScreen,
                                  searchTextEditingController:
                                      searchTextEditingController,
                                  planTypeId: planTypeId,
                                  coachId: coachId,
                                  studentId: studentId,
                                  planStatusList: planStatusList,
                                  setCoachId: setCoachId,
                                  setStudentId: setStudentId,
                                ),
                              )),
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
              BlocBuilder<GetPlansBySortBloc, GetPlansBySortState>(
                builder: (context, state) {
                  if (state is GetPlansBySortLoadingState)
                    return MyWaiting();
                  else if (state is GetPlansBySortLoadedState) {
                    if (state.page_planTypeLogVm != null &&
                        state.page_planTypeLogVm!.items != null &&
                        state.page_planTypeLogVm!.items!.isNotEmpty) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(bottom: padding),
                        itemBuilder: (context, index) {
                          if (index < state.page_planTypeLogVm!.items!.length)
                            return ItemDietary(
                                sizeScreen: sizeScreen,
                                planTypeLogVm:
                                    state.page_planTypeLogVm!.items![index]);
                          else
                            return MyWaiting();
                        },
                        itemCount: state.page_planTypeLogVm!.hasNext!
                            ? state.page_planTypeLogVm!.items!.length + 1
                            : state.page_planTypeLogVm!.items!.length,
                      );
                    } else
                      return NoData();
                  } else
                    return Container();
                },
              ),
              // Expanded(
              //     child: ListView.builder(
              //   padding: EdgeInsets.only(bottom: padding),
              //   itemBuilder: (context, index) => ItemDietary(
              //     sizeScreen: sizeScreen,
              //     data: listItem[index],
              //   ),
              //   itemCount: listItem.length,
              // )),
              // ItemDietary(sizeScreen: sizeScreen,data: ,)
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDietary extends StatelessWidget {
  const ItemDietary(
      {Key? key, required this.sizeScreen, required this.planTypeLogVm})
      : super(key: key);

  final Size sizeScreen;
  final PlanTypeLogvm planTypeLogVm;

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
                              planTypeLogVm.planTypeTitle ?? "",
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
                              'شاگرد :',
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: padding,
                            ),
                            //                     CircleAvatar(
                            // radius: sizeScreen.width > 550 ? 25 : 15,
                            // backgroundImage: NetworkImage(planTypeLogVm.userPic),
                            // ),
                            SizedBox(
                              width: padding,
                            ),
                            Text(
                              planTypeLogVm.userFullName ?? "",
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle),
                                  fontWeight: FontWeight.w500),
                            ),
                            // Container(
                            //   child: Stack(
                            //       children: List.generate(
                            //           data['apprentice'].length > 3
                            //               ? 3
                            //               : data['apprentice'].length,
                            //           (index) => ItemRequestInStack(
                            //               index: index + 1,
                            //               sizeScreen: sizeScreen,
                            //               image: data['apprentice'][index]))),
                            // ),
                            // Spacer(),
                            // InkWell(
                            //   onTap: () async {
                            //     await AllApprenticeScreen()
                            //         .allApprentice(context, sizeScreen, data);
                            //   },
                            //   child: Icon(
                            //     Icons.arrow_forward_ios,
                            //     color: Color(0xff00B4D8),
                            //     size: kFontSizeText(sizeScreen, FontSize.title),
                            //   ),
                            // )
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
                                      text: planTypeLogVm.nPlanType ?? "",
                                      style: textStyle.copyWith(
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.subTitle),
                                          fontWeight: FontWeight.w400))
                                ])),
                            Text(
                              planTypeLogVm.nPlanStatus ?? "",
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle),
                                  color: planTypeLogVm.nPlanStatus ==
                                          'شروع نشده'
                                      ? Color(0xffFFAA00)
                                      : planTypeLogVm.nPlanStatus == 'تمام شده'
                                          ? Color(0xff01D43F)
                                          : planTypeLogVm.nPlanStatus ==
                                                  'در حال انجام'
                                              ? Color(0xff48CAE4)
                                              : Color(0xffFF003D)),
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
                            Text(
                                '${planTypeLogVm.nStartDate} تا ${planTypeLogVm.nEndDate}',
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
                                      text:
                                          '${planTypeLogVm.nTotalPrice} تومان',
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
