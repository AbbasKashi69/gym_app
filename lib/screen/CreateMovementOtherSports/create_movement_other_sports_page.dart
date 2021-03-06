import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeDayTermVm.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/AnonymousPlanTypeDetail/AnonymousPlanTypeDetailFormVm.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovement/components/warning_delete_trun_screen.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CreateMovementOtherSportsPage extends StatefulWidget {
  static const routeName = '/CreateMovementOtherSportsPage';
  CreateMovementOtherSportsPage(
      {Key? key,
      required this.anonymousPlanTypeDayTermVmOriginal,
      required this.anonymousPlantypeFormVmOriginal})
      : super(key: key);
  AnonymousPlanTypeDayTermVm anonymousPlanTypeDayTermVmOriginal;
  AnonymousPlantypeFormVm anonymousPlantypeFormVmOriginal;

  @override
  _CreateMovementOtherSportsPageState createState() =>
      _CreateMovementOtherSportsPageState();
}

class _CreateMovementOtherSportsPageState
    extends State<CreateMovementOtherSportsPage> {
  late AnonymousPlanTypeDayTermVm anonymousPlanTypeDayTermVm;
  late AnonymousPlantypeFormVm anonymousPlantypeFormVm;
  @override
  void initState() {
    super.initState();
    anonymousPlanTypeDayTermVm = widget.anonymousPlanTypeDayTermVmOriginal;
    anonymousPlantypeFormVm = widget.anonymousPlantypeFormVmOriginal;
    //   anonymousPlanTypeDayTermVm = AnonymousPlanTypeDayTermVm.fromJson(
    //       widget.anonymousPlanTypeDayTermVmOriginal.toJson());
    //   anonymousPlantypeFormVm = AnonymousPlantypeFormVm.fromJson(
    //       widget.anonymousPlantypeFormVmOriginal.toJson());
  }

  bool isEmptyTextField = true;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: anonymousPlanTypeDayTermVm.dayNumber != 3
            ? '?????? ${anonymousPlanTypeDayTermVm.dayNumber.toString().toWord()}??'
            : '?????? ??????',
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: kBodyDecoration,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: padding / 2),
                margin: EdgeInsets.symmetric(vertical: padding),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Row(
                      children: List.generate(
                        anonymousPlanTypeDayTermVm.termsCount!,
                        (index) => ItemFilterChip(
                            index: index + 1,
                            onChangeValue: () {
                              setState(() {
                                anonymousPlanTypeDayTermVm.currentTerm =
                                    index + 1;
                              });
                            },
                            deleteItemfunc: (idx) {
                              if (anonymousPlanTypeDayTermVm.termsCount! > 1) {
                                anonymousPlantypeFormVm
                                    .anonymousPlanTypeDetailForms!
                                    .removeWhere((s) => s.termNumber == idx);
                                for (var item in anonymousPlantypeFormVm
                                    .anonymousPlanTypeDetailForms!
                                    .where((element) =>
                                        element.termNumber! > idx)) {
                                  item.termNumber = item.termNumber! - 1;
                                }
                                anonymousPlanTypeDayTermVm.termsCount =
                                    anonymousPlanTypeDayTermVm.termsCount! - 1;
                                anonymousPlanTypeDayTermVm.currentTerm = 1;

                                setState(() {});
                              }
                            },
                            isSelected:
                                anonymousPlanTypeDayTermVm.currentTerm!),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //***** new for change struct of create program  */
                        if (listCurrentDayCurrentTerm(2).isEmpty) {
                          createAnonymousPlanTypeDetailFormvm(false);
                          anonymousPlanTypeDayTermVm.termsCount =
                              anonymousPlanTypeDayTermVm.termsCount! + 1;
                          setState(() {});
                        } else
                          Fluttertoast.showToast(
                              msg: '???????? ?????? ???????? ???????? ???? ???? ????????');
                        //***** new for change struct of create program  */
                      },
                      child: DottedBorder(
                          borderType: BorderType.Circle,
                          dashPattern: [5],
                          color: parseColor('#707070'),
                          child: Container(
                            padding: EdgeInsets.all(padding),
                            decoration: BoxDecoration(shape: BoxShape.circle),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: parseColor('#565656'),
                              ),
                            ),
                          )),
                    )
                  ]),
                ),
              ),
              listCurrentDayCurrentTerm(1).isEmpty
                  ? Center(
                      child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 50),
                      child: NoData(),
                    ))
                  : Column(
                      children: List.generate(
                          listCurrentDayCurrentTerm(1).length,
                          (index) => ItemAddedMovementOtherSports(
                                deleteMovement: (int displayOrder) {
                                  //***** new for change struct of create program  */
                                  if (listCurrentDayCurrentTerm(1).length > 1) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    setState(() {
                                      anonymousPlantypeFormVm
                                          .anonymousPlanTypeDetailForms!
                                          .removeWhere((s) =>
                                              s.displayOrder == displayOrder);
                                    });
                                  }
                                  //***** new for change struct of create program  */

                                  else {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    Fluttertoast.showToast(
                                        msg:
                                            '???????? ?????? ???????? ?????????? ???? ???????? ?????????? ????????');
                                  }
                                },
                                data: listCurrentDayCurrentTerm(1)[index],
                              )),
                    ),
              GestureDetector(
                onTap: () {
                  //***** new for change struct of create program  */
                  if (listCurrentDayCurrentTerm(2).isEmpty)
                  //***** new for change struct of create program  */
                  {
                    createAnonymousPlanTypeDetailFormvm(true);
                    setState(() {});
                  } else
                    Fluttertoast.showToast(msg: '???????? ???????? ???? ???? ????????');
                },
                child: Container(
                  width: gw(0.8),
                  height: gh(0.07),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: parseColor('#00B4D8'),
                    dashPattern: [5],
                    radius: Radius.elliptical(20, 20),
                    child: Container(
                      // width: gw(0.8),
                      // height: gh(0.03),
                      child: Center(
                        child: Text(
                          '???????? ????????',
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.subTitle),
                              color: parseColor('#00B4D8')),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: padding * 2),
                  child: CustomeButton(
                    sizeScreen: sizeScreen,
                    title: '?????? ????????????',
                    onTap: () async {
                      List<AnonymousPlanTypeDetailFormVm> x =
                          anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
                              .where((element) =>
                                  element.dayNumber ==
                                  anonymousPlanTypeDayTermVm.dayNumber)
                              .toList();
                      if (x.isNotEmpty) {
                        for (int i = 0; i < x.length; i++) {
                          if (x[i].nameMovementController!.text.isEmpty) {
                            await Fluttertoast.showToast(
                                msg:
                                    '?????? ???????? ???? ?????? ${x[i].dayNumber.toString().toWord()}?? ?? ???????? ${x[i].termNumber.toString().toWord()}?? ???????? ??????');
                            isEmptyTextField = true;
                            break;
                          }
                          isEmptyTextField = false;
                        }
                        if (!isEmptyTextField) {
                          // widget.anonymousPlanTypeDayTermVmOriginal =
                          //     AnonymousPlanTypeDayTermVm.fromJson(
                          //         anonymousPlanTypeDayTermVm.toJson());

                          widget.anonymousPlanTypeDayTermVmOriginal =
                              anonymousPlanTypeDayTermVm;
                          // widget.anonymousPlantypeFormVmOriginal =
                          //     AnonymousPlantypeFormVm.fromJson(
                          //         anonymousPlantypeFormVm.toJson());
                          widget.anonymousPlantypeFormVmOriginal =
                              anonymousPlantypeFormVm;
                          await Get.showSnackbar(GetBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.black,
                            snackStyle: SnackStyle.FLOATING,
                            message:
                                '???????????? ?? ?????? ${anonymousPlanTypeDayTermVm.dayNumber.toString().toWord()}?? ?????? ????',
                          ));
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.of(context).pop(true);
                          });
                        }
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void createAnonymousPlanTypeDetailFormvm(bool isNewMovement) {
    AnonymousPlanTypeDetailFormVm data = AnonymousPlanTypeDetailFormVm();
    data.descriptionController = TextEditingController();
    data.nameMovementController = TextEditingController();
    data.dayNumber = anonymousPlanTypeDayTermVm.dayNumber;
    data.termNumber = isNewMovement
        ? anonymousPlanTypeDayTermVm.currentTerm
        : anonymousPlanTypeDayTermVm.currentTerm! + 1;
    data.displayOrder = MyHomePage.lastDisplayOtherSports += 1;
    anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
        .removeWhere((s) => s.displayOrder == data.displayOrder);
    anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!.add(data);
  }

  List<AnonymousPlanTypeDetailFormVm> listCurrentDayCurrentTerm(int type) {
    if (type == 1) {
      return anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
          .where((element) =>
              element.dayNumber == anonymousPlanTypeDayTermVm.dayNumber &&
              element.termNumber == anonymousPlanTypeDayTermVm.currentTerm)
          .toList();
    } else
      return anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
          .where((element) =>
              element.dayNumber == anonymousPlanTypeDayTermVm.dayNumber &&
              element.termNumber == anonymousPlanTypeDayTermVm.currentTerm &&
              element.nameMovementController!.text.isEmpty)
          .toList();
  }
}

class ItemAddedMovementOtherSports extends StatelessWidget {
  const ItemAddedMovementOtherSports({
    Key? key,
    required this.data,
    required this.deleteMovement,
  }) : super(key: key);
  final AnonymousPlanTypeDetailFormVm data;
  final Function deleteMovement;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: padding),
        child: DottedBorder(
            borderType: BorderType.RRect,
            // color: parseColor('#0055CC'),
            color: parseColor('#CCCCCC'),
            dashPattern: [5],
            radius: Radius.circular(12),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            width: 3,
                            decoration: BoxDecoration(
                              color: parseColor('#48CAE4'),
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30),
                                  bottom: Radius.circular(30)),
                            ),
                            height: 200,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: 20, right: padding, left: padding),
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  // validator: (String? value) {
                                  //   if (value!.isEmpty)
                                  //     return '?????? ???????? ???????????????? ???????? ????????';
                                  //   return null;
                                  // },
                                  style: textStyle.copyWith(
                                      fontSize: kFontSizeText(
                                          sizeScreen, FontSize.subTitle)),
                                  controller: data.nameMovementController,
                                  decoration: InputDecoration(
                                      suffix: Padding(
                                          padding:
                                              const EdgeInsetsDirectional.only(
                                                  end: 5),
                                          child: GestureDetector(
                                            onTap: () {
                                              deleteMovement(data.displayOrder);
                                            },
                                            child: SvgPicture.asset(
                                              'assets/icons/deleteIcon.svg',
                                              width: 20,
                                              height: 20,
                                            ),
                                          )),
                                      hintText: '?????? ????????',
                                      hintStyle: textStyle.copyWith(
                                          color: Colors.black45,
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.subTitle))),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: 20, right: padding, left: padding),
                                child: TextField(
                                  style: textStyle.copyWith(
                                      fontSize: kFontSizeText(
                                          sizeScreen, FontSize.subTitle)),
                                  controller: data.descriptionController,
                                  decoration: InputDecoration(
                                      hintText: '?????????????? ????????',
                                      hintStyle: textStyle.copyWith(
                                          color: Colors.black45,
                                          fontSize: kFontSizeText(
                                              sizeScreen, FontSize.subTitle))),
                                ),
                              ),
                            ],
                          ))
                        ],
                      ))),
            )));
  }
}

class ItemFilterChip extends StatelessWidget {
  const ItemFilterChip(
      {Key? key,
      required this.onChangeValue,
      required this.deleteItemfunc,
      required this.index,
      required this.isSelected})
      : super(key: key);

  final Function onChangeValue;
  final int isSelected;
  final int index;
  final Function deleteItemfunc;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: padding / 2),
      padding: EdgeInsets.fromLTRB(5, 5, 30, 5),
      decoration: BoxDecoration(
        color: index == isSelected ? Color(0xff00B4D8) : Color(0xffEEEEEE),
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(40), left: Radius.circular(40)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              onChangeValue();
            },
            child: Center(
              child: Text(
                index != 3
                    ? '???????? ${(index).toString().toWord()}??'
                    : '???????? ??????',
                style: textStyle.copyWith(
                    fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                    color: index == isSelected
                        ? Color(0xffffffff)
                        : Color(0xff959595)),
              ),
            ),
          ),
          SizedBox(
            width: padding,
          ),
          GestureDetector(
            onTap: () async {
              bool result = await WarningDelteTrunScreen()
                  .warningDeleteTrun(context, sizeScreen, (index).toString());
              if (result) {
                deleteItemfunc(index);
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Container(
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/trash.svg',
                    width: kFontSizeText(sizeScreen, FontSize.title),
                    height: kFontSizeText(sizeScreen, FontSize.title),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
