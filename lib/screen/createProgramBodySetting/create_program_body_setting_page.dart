import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanType/BodyBuildingPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanTypeDetail/BodyBuildingPlanDayTermVm.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanTypeDetail/BodyBuildingPlanTypeDetailsFormVm.dart';
import 'package:gym_app/blocs/BodyBuildingPlanType/bloc/create_using_form_body_building_bloc.dart';
import 'package:gym_app/blocs/BodyBuildingPlanType/bloc/edit_using_form_body_building_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateProgramOtherSportsSetting/create_program_other_sports_setting_pages.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CreateProgramBodySettingPage extends StatelessWidget {
  static const routeName = '/CreateProgramBodySettingPage';
  CreateProgramBodySettingPage(
      {Key? key, required this.bodyBuildingPlanTypeFormVm})
      : super(key: key);
  final BodyBuildingPlanTypeFormVm? bodyBuildingPlanTypeFormVm;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff48CAE4),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: sizeScreen.height * 0.25,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      margin: EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'برنامه حرکتی',
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
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(40),
                                left: Radius.circular(40))),
                        width: sizeScreen.width * 0.7,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: Color(0xff00B4D8),
                                ),
                                SizedBox(
                                  width: padding,
                                ),
                                Text(
                                  'تنظیمات',
                                  style: textStyle.copyWith(
                                      fontSize: kFontSizeText(
                                          sizeScreen, FontSize.title),
                                      color: Color(0xff00B4D8)),
                                )
                              ],
                            ),
                            Spacer(),
                            IconButton(
                                splashRadius: 10,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff00B4D8),
                                  size:
                                      kFontSizeText(sizeScreen, FontSize.title),
                                ))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            DaysTask(
              sizeScreen: sizeScreen,
              bodyBuildingPlanTypeFormVm: bodyBuildingPlanTypeFormVm!,
            )
          ],
        ),
      ),
    );
  }
}

class DaysTask extends StatefulWidget {
  const DaysTask(
      {Key? key,
      required this.sizeScreen,
      required this.bodyBuildingPlanTypeFormVm})
      : super(key: key);

  final Size sizeScreen;
  final BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm;

  @override
  _DaysTaskState createState() => _DaysTaskState();
}

class _DaysTaskState extends State<DaysTask> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: widget.sizeScreen.height * 0.75),
      width: double.infinity,
      decoration: kBodyDecoration,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: widget.sizeScreen.width > 550
              ? widget.sizeScreen.width * 0.7
              : widget.sizeScreen.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 40),
                child: Text(
                  'روز ها',
                  style: textStyle.copyWith(
                    fontSize: kFontSizeText(widget.sizeScreen, FontSize.title),
                  ),
                ),
              ),
              Column(
                children: List.generate(
                    widget.bodyBuildingPlanTypeFormVm.dayTerms!.length,
                    (index) => Material(
                          color: Colors.transparent,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                // widget.anonymousPlantypeFormVm
                                //     .anonymousPlanTypeDetailForms = [];
                                // MyHomePage.lastDisplayOtherSports = 0;
                                MyBodyVm myBodyVm = MyBodyVm(
                                    bodyBuildingPlanDayTermVm: widget
                                        .bodyBuildingPlanTypeFormVm
                                        .dayTerms![index],
                                    bodyBuildingPlanTypeFormVm:
                                        widget.bodyBuildingPlanTypeFormVm);
                                Navigator.of(context).pushNamed(
                                    CreateMovementPage.routeName,
                                    arguments: myBodyVm);
                              },
                              child: ItemDay(
                                  title: widget.bodyBuildingPlanTypeFormVm
                                      .dayTerms![index].dayNumber
                                      .toString()
                                      .toWord(),
                                  deleteItem: () {
                                    if (widget.bodyBuildingPlanTypeFormVm
                                            .dayTerms!.length >
                                        1) {
                                      widget
                                          .bodyBuildingPlanTypeFormVm.dayTerms!
                                          .removeAt(index);
                                      widget.bodyBuildingPlanTypeFormVm
                                          .bodyBuildingPlanTypeDetails!
                                          .removeWhere((element) =>
                                              element.dayNumber == index + 1);
                                      for (var item in widget
                                          .bodyBuildingPlanTypeFormVm
                                          .bodyBuildingPlanTypeDetails!
                                          .where((element) =>
                                              element.dayNumber! > index)) {
                                        item.dayNumber = item.dayNumber! - 1;
                                      }
                                      for (var item in widget
                                          .bodyBuildingPlanTypeFormVm.dayTerms!
                                          .where((element) =>
                                              element.dayNumber! > index)) {
                                        item.dayNumber = item.dayNumber! - 1;
                                      }

                                      setState(() {});
                                    } else
                                      Fluttertoast.showToast(
                                          msg:
                                              'برنامه باید حداقل یک روز داشته باشد');
                                  }),
                            ),
                          ),
                        )),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (widget
                      .bodyBuildingPlanTypeFormVm.bodyBuildingPlanTypeDetails!
                      .where((element) =>
                          element.dayNumber ==
                                  widget.bodyBuildingPlanTypeFormVm.dayTerms!
                                      .last.dayNumber &&
                              element.nameMovementController!.text.isEmpty ||
                          element.setController!.text.isEmpty)
                      .toList()
                      .isEmpty)
                    setState(() {
                      widget.bodyBuildingPlanTypeFormVm.dayTerms!.add(
                          BodyBuildingPlanDayTermVm(
                              currentTerm: 1,
                              termsCount: 1,
                              dayNumber: widget.bodyBuildingPlanTypeFormVm
                                      .dayTerms!.length +
                                  1));
                      widget.bodyBuildingPlanTypeFormVm
                          .bodyBuildingPlanTypeDetails!
                          .add(BodyBuildingPlanTypeDetailsFormVm(
                              descriptionController: TextEditingController(),
                              nameMovementController: TextEditingController(),
                              setController: TextEditingController(),
                              listSetItemsTextController: [
                                TextEditingController()
                              ],
                              dayNumber: widget
                                  .bodyBuildingPlanTypeFormVm.dayTerms!.length,
                              termNumber: 1,
                              displayOrder: MyHomePage.lastDisplayOtherSports +=
                                  1));
                    });
                  else
                    Fluttertoast.showToast(
                        msg: 'لطفا آیتم های روز فعلی رو پر کنید');
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: padding, horizontal: padding),
                  height: widget.sizeScreen.height * 0.07,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: Color(0xff00B4D8),
                    dashPattern: [5],
                    radius: Radius.elliptical(20, 20),
                    child: Container(
                      // width: gw(0.8),
                      // height: gh(0.03),
                      child: Center(
                        child: Text(
                          'روز جدید',
                          style: textStyle.copyWith(
                              fontSize: kFontSizeText(
                                  widget.sizeScreen, FontSize.subTitle),
                              color: Color(0xff00B4D8)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              if (widget.bodyBuildingPlanTypeFormVm.isCreate!)
                _onTapCreate()
              else
                _onTapEdit()
            ],
          ),
        ),
      ),
    );
  }

  Widget _onTapCreate() {
    return BlocConsumer<CreateUsingFormBodyBuildingBloc,
        CreateUsingFormBodyBuildingState>(
      listener: (context, state) async {
        if (state is CreateUsingFormBodyBuildingLoadedState) {
          if (state.resultObject != null && state.resultObject!.success!) {
            await Fluttertoast.showToast(msg: state.resultObject!.message!);
            Navigator.of(context).pushNamedAndRemoveUntil(
                MyHomePage.routeName, (route) => false);
          } else if (state.resultObject != null)
            Fluttertoast.showToast(msg: state.resultObject!.message!);
          else
            Fluttertoast.showToast(msg: 'دوباره امتحان کنید');
        }
      },
      builder: (context, state) {
        if (state is CreateUsingFormBodyBuildingLoadingState)
          return MyWaiting();
        else
          return CustomeButton(
              sizeScreen: widget.sizeScreen,
              title: "ثبت",
              onTap: () {
                if (widget
                    .bodyBuildingPlanTypeFormVm.bodyBuildingPlanTypeDetails!
                    .where((element) =>
                        element.dayNumber ==
                            widget.bodyBuildingPlanTypeFormVm.dayTerms!.last
                                .dayNumber &&
                        (element.nameMovementController!.text.isEmpty ||
                            element.setController!.text.isEmpty))
                    .toList()
                    .isEmpty) {
                  BlocProvider.of<CreateUsingFormBodyBuildingBloc>(context).add(
                      CreateUsingFormBodyBuildingLoadingEvent(
                          bodyBuildingPlanTypeFormVm:
                              widget.bodyBuildingPlanTypeFormVm));
                } else
                  Fluttertoast.showToast(
                      msg: 'برنامه باید حداقل یک آیتم داشته باشد');
              });
      },
    );
  }

  Widget _onTapEdit() {
    return BlocConsumer<EditUsingFormBodyBuildingBloc,
        EditUsingFormBodyBuildingState>(
      listener: (context, state) async {
        if (state is EditUsingFormBodyBuildingLoadedState) {
          if (state.resultObject != null && state.resultObject!.success!) {
            await Fluttertoast.showToast(msg: state.resultObject!.message!);
            Navigator.of(context).pushNamedAndRemoveUntil(
                MyHomePage.routeName, (route) => false);
          } else if (state.resultObject != null)
            Fluttertoast.showToast(msg: state.resultObject!.message!);
          else
            Fluttertoast.showToast(msg: 'دوباره امتحان کنید');
        }
      },
      builder: (context, state) {
        if (state is EditUsingFormBodyBuildingLoadingState)
          return MyWaiting();
        else
          return CustomeButton(
              sizeScreen: widget.sizeScreen,
              title: "ثبت",
              onTap: () {
                if (widget
                    .bodyBuildingPlanTypeFormVm.bodyBuildingPlanTypeDetails!
                    .where((element) =>
                        element.dayNumber ==
                            widget.bodyBuildingPlanTypeFormVm.dayTerms!.last
                                .dayNumber &&
                        (element.nameMovementController!.text.isEmpty ||
                            element.setController!.text.isEmpty))
                    .toList()
                    .isEmpty) {
                  BlocProvider.of<EditUsingFormBodyBuildingBloc>(context).add(
                      EditUsingFormBodyBuildingLoadingEvent(
                          bodyBuildingPlanTypeFormVm:
                              widget.bodyBuildingPlanTypeFormVm));
                } else
                  Fluttertoast.showToast(
                      msg: 'آیتم های روز آخر خود را پر کنید');
              });
      },
    );
  }
}

class MyBodyVm {
  final BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm;
  final BodyBuildingPlanDayTermVm bodyBuildingPlanDayTermVm;
  MyBodyVm(
      {required this.bodyBuildingPlanDayTermVm,
      required this.bodyBuildingPlanTypeFormVm});
}
