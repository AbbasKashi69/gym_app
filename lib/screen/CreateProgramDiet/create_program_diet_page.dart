import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeDayMealVm.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_students_as_person_list_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customeTextField.dart';
import 'package:gym_app/screen/CreateProgramDietSetting/create_program_diet_setting_page.dart';
import 'package:gym_app/screen/CreateProgramOtherSports/components/select_student_screen.dart';
import 'package:gym_app/screen/CreateProgramOtherSports/create_program_other_sports_page.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class CreateProgramDietPage extends StatelessWidget {
  CreateProgramDietPage({Key? key}) : super(key: key);
  static const routeName = '/createProgramDietPage';
  final TextEditingController _priceTextEditingController =
      TextEditingController();
  final TextEditingController _titleTextEditingController =
      TextEditingController();
  final TextEditingController _startDateTextEditingController =
      TextEditingController();
  final TextEditingController _endDateTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();
  final DietPlanTypeFormVm dietPlantypeFormVm = DietPlanTypeFormVm(
      students: [],
      dayMeals: [
        DietPlanTypeDayMealVm(dayNumber: 1, mealsCount: 1, currentTerm: 1)
      ],
      dietPlanTypeDetailForms: [],
      isPrivate: CurrentUserVm.roleType != 3 ? false : true);
  final GlobalKey<FormState> _dietProgramKey = GlobalKey<FormState>();

  Future<void> setStartTimePicker(BuildContext context) async {
    var x = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1400, 1, 8),
      lastDate: Jalali(1405, 12),
    );
    if (x != null) {
      _startDateTextEditingController.text = x.toJalaliDateTime().split(' ')[0];
    }
  }

  Future<void> setEndTimePicker(BuildContext context) async {
    var x = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1400, 1, 8),
      lastDate: Jalali(1405, 12),
    );
    if (x != null) {
      _endDateTextEditingController.text = x.toJalaliDateTime().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: 'ایجاد برنامه غذایی',
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _dietProgramKey,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: padding * 2, vertical: padding),
            decoration: kBodyDecoration,
            constraints: BoxConstraints(minHeight: Get.height),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: Get.width * 0.8,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (String? value) {
                        if (value!.isEmpty) return 'هزینه نمیتواند خالی باشد';
                        return null;
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (String value) {},
                      controller: _priceTextEditingController,
                      decoration: kInputDecorationTextField.copyWith(
                          hintStyle: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.subTitle),
                              color: kHintText),
                          hintText: 'هزینه',
                          suffix: Container(
                            width: Get.width * 0.4,
                            padding: EdgeInsets.symmetric(horizontal: padding),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'ریال',
                                  style: textStyle.copyWith(
                                    fontSize: kFontSizeText(
                                      sizeScreen,
                                      FontSize.subTitle,
                                    ),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      if (_priceTextEditingController
                                          .text.isEmpty)
                                        _priceTextEditingController.text = '0';
                                      int x = int.parse(
                                          _priceTextEditingController.text);
                                      x += 100000;
                                      _priceTextEditingController.text =
                                          x.toString();
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: kFontSizeText(
                                              sizeScreen, FontSize.title) +
                                          4,
                                    ))
                              ],
                            ),
                          ),
                          prefix: Container(
                              width: Get.width * 0.2,
                              padding:
                                  EdgeInsets.symmetric(horizontal: padding),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: Icon(
                                      Icons.remove,
                                      size: kFontSizeText(
                                              sizeScreen, FontSize.title) +
                                          4,
                                    ),
                                    onTap: () {
                                      if (_priceTextEditingController
                                              .text.isNotEmpty &&
                                          int.tryParse(
                                                  _priceTextEditingController
                                                      .text)! >=
                                              100000) {
                                        int x = int.parse(
                                            _priceTextEditingController.text);
                                        x -= 100000;
                                        _priceTextEditingController.text =
                                            x.toString();
                                      }
                                    },
                                  ),
                                  Text('')
                                ],
                              ))),
                      style: textStyle.copyWith(
                        fontSize: kFontSizeText(
                          sizeScreen,
                          FontSize.subTitle,
                        ),
                      ),
                    ),
                    SizedBox(height: padding * 2),
                    CustomeTextField(
                      onChange: (String vlue) {},
                      validator: (String value) {
                        if (value.isEmpty)
                          return 'نام برنامه نمیتواند خالی باشد';
                        return null;
                      },
                      onSubmited: (String value) {},
                      textEditingController: _titleTextEditingController,
                      hintText: 'نام برنامه',
                    ),
                    SizedBox(height: padding * 2),
                    GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        await setStartTimePicker(context);
                      },
                      child: CustomeTextField(
                        onChange: (String value) {},
                        validator: (String value) {
                          if (value.isEmpty)
                            return 'تاریخ شروع نمیتواند خالی باشد';
                          return null;
                        },
                        onSubmited: (String value) {},
                        textEditingController: _startDateTextEditingController,
                        isReadOnly: true,
                        isEnable: false,
                        hintText: 'تاریخ شروع',
                      ),
                    ),
                    SizedBox(height: padding * 2),
                    GestureDetector(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        await setEndTimePicker(context);
                      },
                      child: CustomeTextField(
                        onChange: (String value) {},
                        validator: (String value) {
                          if (value.isEmpty)
                            return 'تاریخ پایان نمیتواند خالی باشد';
                          return null;
                        },
                        onSubmited: (String value) {},
                        textEditingController: _endDateTextEditingController,
                        isReadOnly: true,
                        isEnable: false,
                        hintText: 'تاریخ پایان',
                      ),
                    ),
                    SizedBox(height: padding * 2),
                    CurrentUserVm.roleType != 3
                        ? ItemAddedStudentsDiet(
                            dietPlantypeFormVm: dietPlantypeFormVm,
                            sizeScreen: sizeScreen)
                        : Container(),
                    SizedBox(
                      height: padding,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: padding, bottom: padding),
                      padding: EdgeInsets.only(right: padding, top: padding),
                      decoration: ShapeDecoration(
                          color: Color(0xfffBfBfB),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Color(0xffEBEBEB)))),
                      child: TextFormField(
                        controller: _descriptionTextEditingController,
                        decoration: InputDecoration(
                            hintText: 'توضیحات برنامه',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding / 2),
                            border: InputBorder.none),
                        minLines: 7,
                        // any number you need (It works as the rows for the textarea)
                        // maxLength: 1000,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        textAlign: TextAlign.justify,
                        style: textStyle.copyWith(
                            height: 1.5,
                            fontSize:
                                kFontSizeText(sizeScreen, FontSize.subTitle)),
                      ),
                    ),
                    SizedBox(
                      height: padding,
                    ),
                    CustomeButton(
                      sizeScreen: sizeScreen,
                      title: 'ادامه',
                      onTap: () {
                        if (_dietProgramKey.currentState!.validate()) {
                          dietPlantypeFormVm.dayMeals = [
                            DietPlanTypeDayMealVm(
                                dayNumber: 1, mealsCount: 1, currentTerm: 1)
                          ];
                          dietPlantypeFormVm.title =
                              _titleTextEditingController.text;
                          dietPlantypeFormVm.totalPrice = int.tryParse(
                              _priceTextEditingController.text.isEmpty
                                  ? '0'
                                  : _priceTextEditingController.text);
                          dietPlantypeFormVm.nStartDate =
                              _startDateTextEditingController.text;
                          dietPlantypeFormVm.nEndDate =
                              _endDateTextEditingController.text;
                          dietPlantypeFormVm.description =
                              _descriptionTextEditingController.text;
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pushNamed(
                              CreateProgramDietSettingPage.routeName,
                              arguments: dietPlantypeFormVm);
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ItemAddedStudentsDiet extends StatefulWidget {
  const ItemAddedStudentsDiet({
    Key? key,
    required this.dietPlantypeFormVm,
    required this.sizeScreen,
  }) : super(key: key);

  final DietPlanTypeFormVm dietPlantypeFormVm;
  final Size sizeScreen;

  @override
  _ItemAddedStudentsDietState createState() => _ItemAddedStudentsDietState();
}

class _ItemAddedStudentsDietState extends State<ItemAddedStudentsDiet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () async {
            FocusScope.of(context).unfocus();
            var x = await showModalBottomSheet(
                isDismissible: true,
                elevation: 20,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (ctx) => BlocProvider.value(
                    value: BlocProvider.of<GetStudentsAsPersonListBloc>(context)
                      ..add(GetStudentsAsPersonListLoadingEvent()),
                    child: SelectStudentScreen()));
            if (x != null) {
              x = x as PersonListVm;
              var isExist = widget.dietPlantypeFormVm.students!
                  .where((element) => element.userFullName == x.userFullName)
                  .toList();
              if (isExist.isEmpty) {
                widget.dietPlantypeFormVm.students!.add(x);
                setState(() {});
              }
            }
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: padding),
            padding: EdgeInsets.symmetric(horizontal: padding),
            decoration: ShapeDecoration(
                color: Color(0xfffBfBfB),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color(0xffEBEBEB)))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      size: kFontSizeText(widget.sizeScreen, FontSize.title),
                      color: Color(0xff48CAE4),
                    ),
                    SizedBox(
                      width: padding / 2,
                    ),
                    Text(
                      'افزودن شاگرد',
                      style: textStyle.copyWith(
                        color: Color(0xff48CAE4),
                        fontSize:
                            kFontSizeText(widget.sizeScreen, FontSize.subTitle),
                      ),
                    )
                  ],
                ),
                Material(
                    child: Tooltip(
                  message: 'افزدون برنامه برای خودم',
                  verticalOffset: 20,
                  textStyle: textStyle.copyWith(
                      fontSize:
                          kFontSizeText(widget.sizeScreen, FontSize.subTitle),
                      color: Colors.white),
                  child: IconButton(
                      splashRadius: 20,
                      onPressed: () {
                        if (!widget.dietPlantypeFormVm.isPrivate!) {
                          widget.dietPlantypeFormVm.isPrivate = true;
                          setState(() {});
                        }
                      },
                      iconSize:
                          kFontSizeText(widget.sizeScreen, FontSize.title) + 5,
                      icon: Icon(
                        Icons.person_add_alt_rounded,
                        color: Color(0xff48CAE4),
                      )),
                ))
              ],
            ),
          ),
        ),
        Wrap(
          direction: Axis.horizontal,
          textDirection: TextDirection.rtl,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          runAlignment: WrapAlignment.start,
          spacing: padding,
          children: widget.dietPlantypeFormVm.students != null &&
                  widget.dietPlantypeFormVm.students!.isNotEmpty
              ? List.generate(
                  widget.dietPlantypeFormVm.students!.length,
                  (index) => AddedStudent(
                        personListVm:
                            widget.dietPlantypeFormVm.students![index],
                        removeItem: (PersonListVm personListVm) {
                          widget.dietPlantypeFormVm.students!
                              .remove(personListVm);
                          setState(() {});
                        },
                      ))
              : [Container()],
        ),
        widget.dietPlantypeFormVm.isPrivate!
            ? AddedStudent(
                personListVm: PersonListVm(userFullName: 'خودم'),
                removeItem: (PersonListVm personListVm) {
                  widget.dietPlantypeFormVm.isPrivate = false;
                  setState(() {});
                })
            : Container()
      ],
    );
  }
}
