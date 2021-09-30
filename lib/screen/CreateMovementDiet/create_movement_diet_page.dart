import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeDayMealVm.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/DietPlanTypeDetail/DietPlanTypeDetailFormVm.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovementOtherSports/create_movement_other_sports_page.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CreateMovementDietPage extends StatefulWidget {
  static const routeName = '/CreateMovementDietPage';
  const CreateMovementDietPage(
      {Key? key,
      required this.dietPlanTypeDayTermVm,
      required this.dietPlanTypeFormVm})
      : super(key: key);
  final DietPlanTypeDayMealVm dietPlanTypeDayTermVm;
  final DietPlanTypeFormVm dietPlanTypeFormVm;

  @override
  _CreateMovementDietPageState createState() => _CreateMovementDietPageState();
}

class _CreateMovementDietPageState extends State<CreateMovementDietPage> {
  bool isEmptyTextField = true;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        List<DietPlanTypeDetailFormVm> x = widget
            .dietPlanTypeFormVm.dietPlanTypeDetailForms!
            .where((element) =>
                element.dayNumber == widget.dietPlanTypeDayTermVm.dayNumber)
            .toList();
        for (int i = 0; i < x.length; i++) {
          x[i].nameDietController!.clear();
          x[i].descriptionController!.clear();
        }
        return Future.value(true);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: kColorAppbar,
        appBar: AppBarWidget(
          title: widget.dietPlanTypeDayTermVm.dayNumber != 3
              ? 'روز ${widget.dietPlanTypeDayTermVm.dayNumber.toString().toWord()}م'
              : 'روز سوم',
          onBack: () async {
            List<DietPlanTypeDetailFormVm> x = widget
                .dietPlanTypeFormVm.dietPlanTypeDetailForms!
                .where((element) =>
                    element.dayNumber == widget.dietPlanTypeDayTermVm.dayNumber)
                .toList();
            for (int i = 0; i < x.length; i++) {
              x[i].nameDietController!.clear();
              x[i].descriptionController!.clear();
            }
            Navigator.of(context).pop();
          },
        ),
        body: SingleChildScrollView(
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
                          widget.dietPlanTypeDayTermVm.mealsCount!,
                          (index) => ItemFilterChip(
                              index: index + 1,
                              onChangeValue: () {
                                setState(() {
                                  widget.dietPlanTypeDayTermVm.currentTerm =
                                      index + 1;
                                });
                              },
                              deleteItemfunc: (idx) {
                                if (widget.dietPlanTypeDayTermVm.mealsCount! >
                                    1) {
                                  widget.dietPlanTypeFormVm
                                      .dietPlanTypeDetailForms!
                                      .removeWhere((s) => s.mealNumber == idx);
                                  for (var item in widget.dietPlanTypeFormVm
                                      .dietPlanTypeDetailForms!
                                      .where((element) =>
                                          element.mealNumber! > idx)) {
                                    item.mealNumber = item.mealNumber! - 1;
                                  }
                                  widget.dietPlanTypeDayTermVm.mealsCount =
                                      widget.dietPlanTypeDayTermVm.mealsCount! -
                                          1;
                                  widget.dietPlanTypeDayTermVm.currentTerm = 1;

                                  setState(() {});
                                }
                              },
                              isSelected:
                                  widget.dietPlanTypeDayTermVm.currentTerm!),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          widget.dietPlanTypeDayTermVm.mealsCount =
                              widget.dietPlanTypeDayTermVm.mealsCount! + 1;
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
                widget.dietPlanTypeFormVm.dietPlanTypeDetailForms!
                        .where((s) =>
                            s.dayNumber ==
                                widget.dietPlanTypeDayTermVm.dayNumber &&
                            s.mealNumber ==
                                widget.dietPlanTypeDayTermVm.currentTerm)
                        .toList()
                        .isEmpty
                    ? Center(
                        child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 50),
                        child: NoData(),
                      ))
                    : Column(
                        children: List.generate(
                            widget.dietPlanTypeFormVm.dietPlanTypeDetailForms!
                                .where((s) =>
                                    s.dayNumber ==
                                        widget
                                            .dietPlanTypeDayTermVm.dayNumber &&
                                    s.mealNumber ==
                                        widget
                                            .dietPlanTypeDayTermVm.currentTerm)
                                .toList()
                                .length,
                            (index) => ItemAddedMovementOtherSports(
                                  deleteMovement: (int displayOrder) {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    setState(() {
                                      widget.dietPlanTypeFormVm
                                          .dietPlanTypeDetailForms!
                                          .removeWhere((s) =>
                                              s.displayOrder == displayOrder);
                                    });
                                  },
                                  data: widget.dietPlanTypeFormVm
                                      .dietPlanTypeDetailForms!
                                      .where((s) =>
                                          s.dayNumber ==
                                              widget.dietPlanTypeDayTermVm
                                                  .dayNumber &&
                                          s.mealNumber ==
                                              widget.dietPlanTypeDayTermVm
                                                  .currentTerm)
                                      .toList()[index],
                                )),
                      ),
                GestureDetector(
                  onTap: () {
                    DietPlanTypeDetailFormVm data = DietPlanTypeDetailFormVm();
                    data.descriptionController = TextEditingController();
                    data.nameDietController = TextEditingController();
                    data.dayNumber = widget.dietPlanTypeDayTermVm.dayNumber;
                    data.mealNumber = widget.dietPlanTypeDayTermVm.currentTerm;
                    data.displayOrder = MyHomePage.lastDisplayOtherSports += 1;
                    widget.dietPlanTypeFormVm.dietPlanTypeDetailForms!
                        .removeWhere(
                            (s) => s.displayOrder == data.displayOrder);
                    widget.dietPlanTypeFormVm.dietPlanTypeDetailForms!
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
                        List<DietPlanTypeDetailFormVm> x = widget
                            .dietPlanTypeFormVm.dietPlanTypeDetailForms!
                            .where((element) =>
                                element.dayNumber ==
                                widget.dietPlanTypeDayTermVm.dayNumber)
                            .toList();
                        if (x.isNotEmpty) {
                          for (int i = 0; i < x.length; i++) {
                            if (x[i].nameDietController!.text.isEmpty) {
                              await Fluttertoast.showToast(
                                  msg:
                                      'نام حرکت در روز ${x[i].dayNumber.toString().toWord()}م و نوبت ${x[i].mealNumber.toString().toWord()}م خالی است');
                              isEmptyTextField = true;
                              break;
                            }
                            isEmptyTextField = false;
                          }
                          if (!isEmptyTextField) {
                            await Get.showSnackbar(GetBar(
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.black,
                              snackStyle: SnackStyle.FLOATING,
                              message:
                                  'برنامه ی روز ${widget.dietPlanTypeDayTermVm.dayNumber.toString().toWord()}م ثبت شد',
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
  final DietPlanTypeDetailFormVm data;
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
                                  //     return 'نام حرکت نمیتواند خالی باشد';
                                  //   return null;
                                  // },
                                  style: textStyle.copyWith(
                                      fontSize: kFontSizeText(
                                          sizeScreen, FontSize.subTitle)),
                                  controller: data.nameDietController,
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
                                      hintText: 'نام وعده',
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
                                      hintText: 'توضیحات',
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
