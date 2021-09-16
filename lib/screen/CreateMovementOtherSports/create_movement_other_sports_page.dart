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
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CreateMovementOtherSportsPage extends StatefulWidget {
  static const routeName = '/CreateMovementOtherSportsPage';
  const CreateMovementOtherSportsPage(
      {Key? key,
      required this.anonymousPlanTypeDayTermVm,
      required this.anonymousPlantypeFormVm})
      : super(key: key);
  final AnonymousPlanTypeDayTermVm anonymousPlanTypeDayTermVm;
  final AnonymousPlantypeFormVm anonymousPlantypeFormVm;

  @override
  _CreateMovementOtherSportsPageState createState() =>
      _CreateMovementOtherSportsPageState();
}

class _CreateMovementOtherSportsPageState
    extends State<CreateMovementOtherSportsPage> {
  GlobalKey<FormState> nameMovementKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: widget.anonymousPlanTypeDayTermVm.dayNumber != 3
            ? 'روز ${widget.anonymousPlanTypeDayTermVm.dayNumber.toString().toWord()}م'
            : 'روز سوم',
      ),
      body: SingleChildScrollView(
        child: Form(
          key: nameMovementKey,
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
                          widget.anonymousPlanTypeDayTermVm.termsCount!,
                          (index) => ItemFilterChip(
                              index: index + 1,
                              onChangeValue: () {
                                setState(() {
                                  widget.anonymousPlanTypeDayTermVm
                                      .currentTerm = index + 1;
                                });
                              },
                              deleteItemfunc: (idx) {
                                widget.anonymousPlanTypeDayTermVm.termsCount =
                                    widget.anonymousPlanTypeDayTermVm
                                            .termsCount! -
                                        1;
                                widget.anonymousPlantypeFormVm
                                    .anonymousPlanTypeDetailForms!
                                    .removeWhere((s) => s.termNumber == idx);
                                widget.anonymousPlanTypeDayTermVm.currentTerm =
                                    1;

                                setState(() {});
                              },
                              isSelected: widget
                                  .anonymousPlanTypeDayTermVm.currentTerm!),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.anonymousPlanTypeDayTermVm.termsCount =
                              widget.anonymousPlanTypeDayTermVm.termsCount! + 1;
                          setState(() {});
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
                widget.anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
                        .where((s) =>
                            s.dayNumber ==
                                widget.anonymousPlanTypeDayTermVm.dayNumber &&
                            s.termNumber ==
                                widget.anonymousPlanTypeDayTermVm.currentTerm)
                        .toList()
                        .isEmpty
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: NoData(),
                      ))
                    : Column(
                        children: List.generate(
                            widget.anonymousPlantypeFormVm
                                .anonymousPlanTypeDetailForms!
                                .where((s) =>
                                    s.dayNumber ==
                                        widget.anonymousPlanTypeDayTermVm
                                            .dayNumber &&
                                    s.termNumber ==
                                        widget.anonymousPlanTypeDayTermVm
                                            .currentTerm)
                                .toList()
                                .length,
                            (index) => ItemAddedMovementOtherSports(
                                  deleteMovement: (int displayOrder) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    setState(() {
                                      widget.anonymousPlantypeFormVm
                                          .anonymousPlanTypeDetailForms!
                                          .removeWhere((s) =>
                                              s.displayOrder == displayOrder);
                                    });
                                  },
                                  data: widget.anonymousPlantypeFormVm
                                      .anonymousPlanTypeDetailForms!
                                      .where((s) =>
                                          s.dayNumber ==
                                              widget.anonymousPlanTypeDayTermVm
                                                  .dayNumber &&
                                          s.termNumber ==
                                              widget.anonymousPlanTypeDayTermVm
                                                  .currentTerm)
                                      .toList()[index],
                                )),
                      ),
                GestureDetector(
                  onTap: () {
                    AnonymousPlanTypeDetailFormVm data =
                        AnonymousPlanTypeDetailFormVm();
                    data.descriptionController = TextEditingController();
                    data.nameMovementController = TextEditingController();
                    data.dayNumber =
                        widget.anonymousPlanTypeDayTermVm.dayNumber;
                    data.termNumber =
                        widget.anonymousPlanTypeDayTermVm.currentTerm;
                    data.displayOrder = MyHomePage.lastDisplayOtherSports += 1;
                    widget.anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
                        .removeWhere(
                            (s) => s.displayOrder == data.displayOrder);
                    widget.anonymousPlantypeFormVm.anonymousPlanTypeDetailForms!
                        .add(data);
                    setState(() {});
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
                            'حرکت جدید',
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle),
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
                      title: 'ثبت برنامه',
                      onTap: () async {
                        if (nameMovementKey.currentState!.validate()) {
                          await Get.showSnackbar(GetBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.black,
                            snackStyle: SnackStyle.FLOATING,
                            message:
                                'برنامه ی روز ${widget.anonymousPlanTypeDayTermVm.dayNumber.toString().toWord()}م ثبت شد',
                          ));
                          Navigator.of(context).pop();
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
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
                                  validator: (String? value) {
                                    if (value!.isEmpty)
                                      return 'نام حرکت نمیتواند خالی باشد';
                                    return null;
                                  },
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
                                      hintText: 'نام حرکت',
                                      hintStyle: textStyle.copyWith(
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
                                      hintText: 'توضیحات حرکت',
                                      hintStyle: textStyle.copyWith(
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
                    ? 'نوبت ${(index).toString().toWord()}م'
                    : 'نوبت سوم',
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
