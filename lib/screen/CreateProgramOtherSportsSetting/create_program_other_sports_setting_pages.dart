import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeDayTermVm.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/AnonymousPlanTypeDetail/AnonymousPlanTypeDetailFormVm.dart';
import 'package:gym_app/blocs/AnonymousPlanType/bloc/create_using_form_bloc.dart';
import 'package:gym_app/blocs/AnonymousPlanType/bloc/edit_using_form_other_sports_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovementOtherSports/create_movement_other_sports_page.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CreateProgramOtherSportsSettingPage extends StatelessWidget {
  static const routeName = '/CreateProgramOtherSportsSettingPage';
  CreateProgramOtherSportsSettingPage(
      {Key? key, required this.anonymousPlantypeFormVm})
      : super(key: key);
  final AnonymousPlantypeFormVm? anonymousPlantypeFormVm;

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
                            'برنامه سایر رشته ها',
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
              anonymousPlantypeFormVm: anonymousPlantypeFormVm!,
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
      required this.anonymousPlantypeFormVm})
      : super(key: key);

  final Size sizeScreen;
  final AnonymousPlantypeFormVm anonymousPlantypeFormVm;

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
                    widget.anonymousPlantypeFormVm.dayTerms!.length,
                    (index) => Material(
                          color: Colors.transparent,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                // widget.anonymousPlantypeFormVm
                                //     .anonymousPlanTypeDetailForms = [];
                                // MyHomePage.lastDisplayOtherSports = 0;
                                MyVm myVm = MyVm(
                                    anonymousPlanTypeDayTermVm: widget
                                        .anonymousPlantypeFormVm
                                        .dayTerms![index],
                                    anonymousPlantypeFormVm:
                                        widget.anonymousPlantypeFormVm);
                                Navigator.of(context).pushNamed(
                                    CreateMovementOtherSportsPage.routeName,
                                    arguments: myVm);
                              },
                              child: ItemDay(
                                  title: widget.anonymousPlantypeFormVm
                                      .dayTerms![index].dayNumber
                                      .toString()
                                      .toWord(),
                                  deleteItem: () {
                                    //***** new for change struct of create program  */
                                    if (widget.anonymousPlantypeFormVm.dayTerms!
                                            .length >
                                        1) {
                                      widget.anonymousPlantypeFormVm.dayTerms!
                                          .removeAt(index);
                                      widget.anonymousPlantypeFormVm
                                          .anonymousPlanTypeDetailForms!
                                          .removeWhere((element) =>
                                              element.dayNumber == index + 1);

                                      for (var item in widget
                                          .anonymousPlantypeFormVm
                                          .anonymousPlanTypeDetailForms!
                                          .where((element) =>
                                              element.dayNumber! > index)) {
                                        item.dayNumber = item.dayNumber! - 1;
                                      }

                                      for (var item in widget
                                          .anonymousPlantypeFormVm.dayTerms!
                                          .where((element) =>
                                              element.dayNumber! > index)) {
                                        item.dayNumber = item.dayNumber! - 1;
                                      }
                                      setState(() {});
                                    } else
                                      //***** new for change struct of create program  */
                                      Fluttertoast.showToast(
                                          msg:
                                              'برنامه باید حداقل یک روز داشته باشد');
                                    //***** new for change struct of create program  */
                                  }),
                            ),
                          ),
                        )),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  //***** new for change struct of create program  */
                  if (widget
                      .anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
                      .where((element) =>
                          element.dayNumber ==
                              widget.anonymousPlantypeFormVm.dayTerms!.last
                                  .dayNumber &&
                          element.nameMovementController!.text.isEmpty)
                      .toList()
                      .isEmpty)
                    //***** new for change struct of create program  */
                    setState(() {
                      widget.anonymousPlantypeFormVm.dayTerms!.add(
                          AnonymousPlanTypeDayTermVm(
                              currentTerm: 1,
                              termsCount: 1,
                              dayNumber: widget.anonymousPlantypeFormVm
                                      .dayTerms!.length +
                                  1));
                      //***** new for change struct of create program  */
                      widget
                          .anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
                          .add(AnonymousPlanTypeDetailFormVm(
                              descriptionController: TextEditingController(),
                              nameMovementController: TextEditingController(),
                              dayNumber: widget
                                  .anonymousPlantypeFormVm.dayTerms!.length,
                              termNumber: 1,
                              displayOrder: MyHomePage.lastDisplayOtherSports +=
                                  1));
                      //***** new for change struct of create program  */
                    });
                  //***** new for change struct of create program  */
                  else
                    Fluttertoast.showToast(
                        msg: 'لطفا آیتم های روز فعلی رو پر کنید');
                  //***** new for change struct of create program  */
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
              if (widget.anonymousPlantypeFormVm.isCreate!)
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
    return BlocConsumer<CreateUsingFormOthersSportsBloc,
        CreateUsingFormOthersSportsState>(
      listener: (context, state) async {
        if (state is CreateUsingFormOthersSportsLoadedState) {
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
        if (state is CreateUsingFormOthersSportsLoadingState)
          return MyWaiting();
        else
          return CustomeButton(
              sizeScreen: widget.sizeScreen,
              title: "ثبت",
              onTap: () {
                //***** new for change struct of create program  */
                if (widget.anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
                    .where((element) =>
                        element.dayNumber ==
                            widget.anonymousPlantypeFormVm.dayTerms!.last
                                .dayNumber &&
                        element.nameMovementController!.text.isEmpty)
                    .toList()
                    .isEmpty) {
                  BlocProvider.of<CreateUsingFormOthersSportsBloc>(context).add(
                      CreateUsingFormOtherSportsLoadingEvent(
                          anonymousPlantypeFormVm:
                              widget.anonymousPlantypeFormVm));
                } else
                  Fluttertoast.showToast(
                      msg: 'آیتم های روز آخر خود را پر کنید');
                //***** new for change struct of create program  */
              });
      },
    );
  }

  Widget _onTapEdit() {
    return BlocConsumer<EditUsingFormOtherSportsBloc,
        EditUsingFormOtherSportsState>(
      listener: (context, state) async {
        if (state is EditUsingFormOtherSportsLoadedState) {
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
        if (state is EditUsingFormOtherSportsLoadingState)
          return MyWaiting();
        else
          return CustomeButton(
              sizeScreen: widget.sizeScreen,
              title: "ثبت",
              onTap: () {
                //***** new for change struct of create program  */
                if (widget.anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
                    .where((element) =>
                        element.dayNumber ==
                            widget.anonymousPlantypeFormVm.dayTerms!.last
                                .dayNumber &&
                        element.nameMovementController!.text.isEmpty)
                    .toList()
                    .isEmpty) {
                  BlocProvider.of<EditUsingFormOtherSportsBloc>(context).add(
                      EditUsingFormOtherSportsLoadingEvent(
                          anonymousPlantypeFormVm:
                              widget.anonymousPlantypeFormVm));
                } else
                  Fluttertoast.showToast(
                      msg: 'آیتم های روز آخر خود را پر کنید');
                //***** new for change struct of create program  */
              });
      },
    );
  }
}

class ItemDay extends StatelessWidget {
  const ItemDay({
    Key? key,
    required this.deleteItem,
    required this.title,
  }) : super(key: key);
  final String title;
  final Function deleteItem;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black12))),
      padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title != "سه" ? 'روز $titleم' : 'روز سوم',
            style: textStyle.copyWith(
              fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
            ),
          ),
          GestureDetector(
            onTap: () {
              deleteItem();
            },
            child: SvgPicture.asset(
              'assets/icons/trash.svg',
              width: kFontSizeText(sizeScreen, FontSize.title) + 8,
              height: kFontSizeText(sizeScreen, FontSize.title) + 8,
            ),
          )
        ],
      ),
    );
  }
}

class MyVm {
  final AnonymousPlantypeFormVm anonymousPlantypeFormVm;
  final AnonymousPlanTypeDayTermVm anonymousPlanTypeDayTermVm;
  MyVm(
      {required this.anonymousPlanTypeDayTermVm,
      required this.anonymousPlantypeFormVm});
}
