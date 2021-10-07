import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentProfileVm.dart';
import 'package:gym_app/ViewModels/UserFlow/UserFlowVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/chage_status_by_id_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/change_status_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_coach_student_profile_bloc.dart';
import 'package:gym_app/blocs/UserFlow/bloc/get_user_flow_by_date_bloc.dart';
import 'package:gym_app/blocs/UserFlow/bloc/get_user_flow_chart_information_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/ListApprentice/components/item_reject_answer.dart';
import 'package:gym_app/screen/ListCoach/components/warning_unFollow_screen.dart';
import 'package:gym_app/screen/PersonalInfo/personal_info_page.dart';
import 'package:gym_app/screen/ProfileApprentice/components/write_program_screen.dart';
import 'package:gym_app/screen/ProfileCoach/components/no_access.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import 'components/chart_chage_body.dart';
import 'components/item_attribute.dart';
import 'components/item_conversation.dart';

class ProfileApprenticePage extends StatefulWidget {
  const ProfileApprenticePage({Key? key, required this.studentId})
      : super(key: key);
  static const routeName = '/ProfileApprenticePage';
  final int studentId;

  @override
  _ProfileApprenticePageState createState() => _ProfileApprenticePageState();
}

late bool isPrivateStudent;
late bool sendReqestInBackPage;

class _ProfileApprenticePageState extends State<ProfileApprenticePage> {
  CoachStudentProfileVm coachStudentProfileVm = CoachStudentProfileVm();
  @override
  void initState() {
    isPrivateStudent = true;
    sendReqestInBackPage = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(sendReqestInBackPage);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: kColorAppbar,
        appBar: AppBarWidget(
          title: 'پروفایل شاگرد',
          onBack: () {
            Navigator.of(context).pop(sendReqestInBackPage);
          },
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
              // constraints: BoxConstraints(minHeight: sizeScreen.height),
              padding: EdgeInsets.symmetric(horizontal: padding),
              decoration: kBodyDecoration,
              child: BlocConsumer<GetCoachStudentProfileBloc,
                  GetCoachStudentProfileState>(
                listener: (context, state) {
                  if (state is GetCoachStudentProfileLoadedState) {
                    if (state.resultObject != null) {
                      if (state.resultObject!.success!) {
                        coachStudentProfileVm = CoachStudentProfileVm.fromJson(
                            state.resultObject!.extra as Map<String, dynamic>);
                        // request to server for get remaind information
                        BlocProvider.of<GetUserFlowByDateBloc>(context).add(
                            GetUserFlowByDateLoadingEvent(
                                coachId: null,
                                studentId: widget.studentId,
                                date: Jalali.now()
                                    .toJalaliDateTime()
                                    .split(' ')[0]));
                        // request to server for get chart
                        BlocProvider.of<GetUserFlowChartInformationBloc>(
                                context)
                            .add(GetUserFlowChartInformationLoadingEvent(
                                coachId: null, studentId: widget.studentId));
                        setState(() {
                          isPrivateStudent = false;
                        });
                      } else {
                        coachStudentProfileVm = CoachStudentProfileVm.fromJson(
                            state.resultObject!.extra as Map<String, dynamic>);
                      }
                    }
                  }
                },
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: state is GetCoachStudentProfileLoadingState
                        ? MyWaiting()
                        : state is GetCoachStudentProfileLoadedState &&
                                state.resultObject != null
                            ? Body(
                                sizeScreen: sizeScreen,
                                coachStudentProfileVm: coachStudentProfileVm,
                                id: widget.studentId,
                              )
                            : state is GetCoachStudentProfileLoadedState &&
                                    state.resultObject == null
                                ? Center(child: NoData())
                                : Container(),
                  );
                },
              )),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body(
      {Key? key,
      required this.sizeScreen,
      required this.coachStudentProfileVm,
      required this.id})
      : super(key: key);

  final Size sizeScreen;
  final CoachStudentProfileVm coachStudentProfileVm;
  final int id;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String setTime;
  late String timeForSend;
  @override
  void initState() {
    super.initState();
    Jalali? jalali = Jalali.now();
    setTime = jalali.formatFullDate();
    timeForSend = jalali.toJalaliDateTime().split(' ')[0];
  }

  UserFlowVm? userFlowVm;

  Future<bool> changeDateReport(BuildContext context) async {
    var x = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1400, 1, 8),
      lastDate: Jalali(1405, 12),
    );
    if (x != null) {
      setTime = x.formatFullDate();
      timeForSend = x.toJalaliDateTime().split(' ')[0];
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: padding, bottom: padding * 2, right: padding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // CircleAvatar(
                    //   radius: widget.sizeScreen.width > 550 ? 35 : 25,
                    //   backgroundImage: NetworkImage(
                    //       widget.coachStudentProfileVm.userPic ?? ""),
                    // ),
                    SizedBox(
                      width: padding,
                    ),
                    RichText(
                        text: TextSpan(
                            text:
                                widget.coachStudentProfileVm.userFullName ?? "",
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    widget.sizeScreen, FontSize.title)),
                            children: [
                          TextSpan(
                              text: ' (شاگرد)',
                              style: textStyle.copyWith(
                                  color: Color(0xff5e5e5e),
                                  fontSize: kFontSizeText(
                                      widget.sizeScreen, FontSize.subTitle)))
                        ])),
                    isPrivateStudent
                        // ? RejectAnswerTask(
                        //     id: widget.id,
                        //   )
                        ? Container()
                        : Expanded(
                            child: Row(
                            children: [
                              Spacer(),
                              BlocConsumer<ChangeStatusByIdBloc,
                                  ChangeStatusByIdState>(
                                listener: (context, state) {
                                  if (state is ChangeStatusByIdLoadedState) {
                                    if (state.resultObject != null) {
                                      if (state.resultObject!.success!) {
                                        Fluttertoast.showToast(
                                            msg: state.resultObject!.message!);
                                        BlocProvider.of<
                                                    GetCoachStudentProfileBloc>(
                                                context)
                                            .add(
                                                GetCoachStudentProfileLoadingEvent(
                                                    coachId: null,
                                                    studentId: widget.id));
                                        sendReqestInBackPage = true;
                                        setState(() {
                                          isPrivateStudent = true;
                                        });
                                      } else
                                        Fluttertoast.showToast(
                                            msg: state.resultObject!.message!);
                                    }
                                  }
                                },
                                builder: (context, state) {
                                  if (state is ChangeStatusByIdLoadingState)
                                    return MyWaiting();
                                  else
                                    return GestureDetector(
                                      onTap: () async {
                                        var result =
                                            await WarningUnFollowScreen()
                                                .warningUnFollow(
                                                    context,
                                                    widget.sizeScreen,
                                                    widget.coachStudentProfileVm
                                                            .userFullName ??
                                                        "",
                                                    false);
                                        if (result) {
                                          BlocProvider.of<ChangeStatusByIdBloc>(
                                                  context)
                                              .add(ChangeStatusByIdLoadingEvent(
                                                  coachId: null,
                                                  studentId: widget.id,
                                                  id: widget.id,
                                                  isAccepted: false));
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: kColorBackgroundItem),
                                        child: Center(
                                            child: SvgPicture.asset(
                                                'assets/icons/trash.svg')),
                                      ),
                                    );
                                },
                              )
                            ],
                          ))
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
                            fontSize: kFontSizeText(
                                widget.sizeScreen, FontSize.title),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: padding / 2,
                      ),
                      Text(
                        widget.coachStudentProfileVm.bodyBuildingPlanCount
                            .toString(),
                        style: textStyle.copyWith(
                            fontSize: kFontSizeText(
                                widget.sizeScreen, FontSize.subTitle),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'برنامه غذایی',
                        style: textStyle.copyWith(
                            fontSize: kFontSizeText(
                                widget.sizeScreen, FontSize.title),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: padding / 2,
                      ),
                      Text(
                        widget.coachStudentProfileVm.dietPlanCount.toString(),
                        style: textStyle.copyWith(
                            fontSize: kFontSizeText(
                                widget.sizeScreen, FontSize.subTitle),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'مربیان',
                        style: textStyle.copyWith(
                            fontSize: kFontSizeText(
                                widget.sizeScreen, FontSize.title),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: padding / 2,
                      ),
                      Text(
                        widget.coachStudentProfileVm.coachCount.toString(),
                        style: textStyle.copyWith(
                            fontSize: kFontSizeText(
                                widget.sizeScreen, FontSize.subTitle),
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: padding * 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: padding,
                        ),
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () async {
                              await WriteProgramScreen()
                                  .writeProgram(context, widget.sizeScreen);
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
                        ),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        isPrivateStudent
            ? Container(
                padding: EdgeInsets.only(top: 30),
                child: NoAccess(
                  isCoach: true,
                ),
              )
            : Column(
                children: [
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
                      Navigator.of(context).pushNamed(
                          PersonalInfoPage.routeName,
                          arguments: widget.coachStudentProfileVm);
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
                    margin: EdgeInsets.only(top: padding * 3, bottom: 20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'نمودار تغییرات بدن',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize:
                              kFontSizeText(widget.sizeScreen, FontSize.title)),
                    ),
                  ),
                  ChartChageBody(),
                  Container(
                    margin: EdgeInsets.only(top: padding * 2, bottom: padding),
                    alignment: Alignment.centerRight,
                    child: Text(
                      'گزارشگیری',
                      style: textStyle.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  ),
                  StatefulBuilder(builder: (context, newState) {
                    return GestureDetector(
                      onTap: () async {
                        bool x = await changeDateReport(context);
                        if (x) {
                          BlocProvider.of<GetUserFlowByDateBloc>(context).add(
                              GetUserFlowByDateLoadingEvent(
                                  coachId: null,
                                  studentId: widget.id,
                                  date: timeForSend));
                          newState(() {});
                        }
                      },
                      child: Container(
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
                                  setTime,
                                  style: textStyle.copyWith(
                                      fontSize: kFontSizeText(widget.sizeScreen,
                                          FontSize.subTitle)),
                                )
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
                    );
                  }),
                  BlocConsumer<GetUserFlowByDateBloc, GetUserFlowByDateState>(
                    listener: (context, state) {
                      if (state is GetUserFlowByDateLoadedState) {
                        if (state.resultObject != null &&
                            state.resultObject!.success!)
                          userFlowVm = UserFlowVm.fromJson(state
                              .resultObject!.extra! as Map<String, dynamic>);
                        else if (state.resultObject != null &&
                            state.resultObject!.success == false)
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                      }
                    },
                    builder: (context, state) {
                      if (state is GetUserFlowByDateLoadingState)
                        return MyWaiting();
                      else if (state is GetUserFlowByDateLoadedState) {
                        if (state.resultObject != null &&
                            state.resultObject!.success!)
                          return ItemLoadedGetUserFlowByDate(
                              userFlowVm: userFlowVm!);
                        else
                          return Container();
                      }
                      return Container();
                    },
                  )
                ],
              ),
      ],
    );
  }
}

// class RejectAnswerTask extends StatelessWidget {
//   const RejectAnswerTask({Key? key, required this.id}) : super(key: key);
//   final int id;

//   @override
//   Widget build(BuildContext context) {
//     final Size sizeScreen = MediaQuery.of(context).size;
//     return Expanded(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           BlocListener<ChangeStatusByIdBloc, ChangeStatusByIdState>(
//               listener: (context, state) async {
//                 if (state is ChangeStatusByIdLoadedState) {
//                   if (state.resultObject != null) {
//                     if (state.resultObject!.success!)
//                       await Fluttertoast.showToast(
//                           msg: state.resultObject!.message!);
//                     Navigator.of(context).pop();
//                   }
//                 }
//               },
//               child: ItemRejectAnswer(
//                 onTap: () {
//                   BlocProvider.of<ChangeStatusByIdBloc>(context).add(
//                       ChangeStatusByIdLoadingEvent(
//                           studentId: id,
//                           coachId: null,
//                           id: id,
//                           isAccepted: false));
//                 },
//                 sizeScreen: sizeScreen,
//                 isAnswer: false,
//               )),
//           SizedBox(
//             width: padding,
//           ),
//           BlocListener<ChangeStatusByIdBloc, ChangeStatusByIdState>(
//               listener: (context, state) {
//                 if (state is ChangeStatusByIdLoadedState) {
//                   if (state.resultObject != null) {
//                     if (state.resultObject!.success!)
//                       BlocProvider.of<GetCoachStudentProfileBloc>(context).add(
//                           GetCoachStudentProfileLoadingEvent(
//                               coachId: null, studentId: id));
//                     Fluttertoast.showToast(msg: state.resultObject!.message!);
//                   }
//                 }
//               },
//               child: ItemRejectAnswer(
//                 onTap: () {
//                   BlocProvider.of<ChangeStatusByIdBloc>(context).add(
//                       ChangeStatusByIdLoadingEvent(
//                           studentId: id,
//                           coachId: null,
//                           id: id,
//                           isAccepted: true));
//                 },
//                 sizeScreen: sizeScreen,
//                 isAnswer: true,
//               )),
//         ],
//       ),
//     );
//   }
// }

class ItemLoadedGetUserFlowByDate extends StatelessWidget {
  ItemLoadedGetUserFlowByDate({Key? key, required this.userFlowVm})
      : super(key: key);
  final UserFlowVm userFlowVm;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: padding),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kColorBackgroundItem),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ItemAttribute(
                              title: 'قد',
                              answer: '${userFlowVm.nHeight} سانتی متر'),
                          ItemAttribute(
                            title: 'وزن',
                            answer: '${userFlowVm.nWeight} کیلو گرم',
                          ),
                        ],
                      )),
                  Spacer()
                ],
              ),
              SizedBox(
                height: padding,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: padding),
                child: ItemAttribute(
                  title: 'مدت زمان تمرین',
                  answer: '${userFlowVm.trainingTime.toString()} دقیقه',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: padding),
                child: ItemAttribute(
                  title: 'رعایت برنامه غذایی',
                  answer: '${userFlowVm.dietPlanFollowPercent.toString()} درصد',
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: padding),
                child: ItemAttribute(
                  title: 'رعایت برنامه تمرینی',
                  answer:
                      '${userFlowVm.anonymousPlanFollowPercent.toString()} درصد',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: padding, bottom: padding / 2),
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
                  style: textStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: kFontSizeText(sizeScreen, FontSize.title)),
                ),
              ),
              Container(
                child: Text(
                  userFlowVm.description,
                  textAlign: TextAlign.justify,
                  style: textStyle.copyWith(
                      height: 1.8,
                      fontWeight: FontWeight.w400,
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
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
            physics: BouncingScrollPhysics(),
            child: userFlowVm.userFlowFiles != null &&
                    userFlowVm.userFlowFiles!.isNotEmpty
                ? Row(
                    children: List.generate(
                        userFlowVm.userFlowFiles!.length,
                        (index) => Container(
                              margin:
                                  EdgeInsets.symmetric(horizontal: padding / 5),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  // child: Image.network(
                                  //     'https://i.pinimg.com/474x/18/48/f5/1848f52697ad28896248b6af0839b39a.jpg'),
                                  child: Image.network(
                                    userFlowVm.userFlowFiles![index].path,
                                    fit: BoxFit.cover,
                                  )
                                  // child: Container(),
                                  ),
                            )),
                  )
                : Center(
                    child: Text(
                      'عکسی وجود ندارد',
                      style: textStyle.copyWith(
                          fontSize: kFontSizeText(sizeScreen, FontSize.title)),
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
