import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanType/BodyBuildingPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanTypeDetail/BodyBuildingPlanDayTermVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_students_as_person_list_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customeTextField.dart';
import 'package:gym_app/screen/CreateProgramOtherSports/components/select_student_screen.dart';
import 'package:gym_app/screen/CreateProgramOtherSports/create_program_other_sports_page.dart';
import 'package:gym_app/screen/createProgramBodySetting/create_program_body_setting_page.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class CreateProgramBodyPage extends StatefulWidget {
  const CreateProgramBodyPage({Key? key}) : super(key: key);
  static const routeName = '/createProgramBodyPage';

  @override
  _CreateProgramBodyPageState createState() => _CreateProgramBodyPageState();
}

class _CreateProgramBodyPageState extends State<CreateProgramBodyPage> {
  late TextEditingController _priceTextEditingController;
  late TextEditingController _titleTextEditingController;
  late TextEditingController _startDateTextEditingController;
  late TextEditingController _endDateTextEditingController;
  late TextEditingController _descriptionTextEditingController;
  late BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm;
  GlobalKey<FormState> _createBodyKey = GlobalKey<FormState>();
  @override
  void initState() {
    _priceTextEditingController = TextEditingController();
    _titleTextEditingController = TextEditingController();
    _startDateTextEditingController = TextEditingController(
        text: Jalali.now().toJalaliDateTime().split(' ')[0]);
    _endDateTextEditingController = TextEditingController(
        text: Jalali.now().toJalaliDateTime().split(' ')[0]);
    _descriptionTextEditingController = TextEditingController();
    bodyBuildingPlanTypeFormVm = BodyBuildingPlanTypeFormVm(
        students: [],
        dayTerms: [
          BodyBuildingPlanDayTermVm(dayNumber: 1, termsCount: 1, currentTerm: 1)
        ],
        bodyBuildingPlanTypeDetails: []);
    super.initState();
  }

  @override
  void dispose() {
    _priceTextEditingController.dispose();
    _titleTextEditingController.dispose();
    _startDateTextEditingController.dispose();
    _endDateTextEditingController.dispose();
    _descriptionTextEditingController.dispose();
    super.dispose();
  }

  Future<void> setStartTimePicker() async {
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

  Future<void> setEndTimePicker() async {
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
        title: 'ایجاد برنامه بدنسازی',
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _createBodyKey,
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
                      onChange: (String vlaue) {},
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
                        await setStartTimePicker();
                      },
                      child: CustomeTextField(
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
                        await setEndTimePicker();
                      },
                      child: CustomeTextField(
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
                    InkWell(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        var x = await showModalBottomSheet(
                            isDismissible: true,
                            elevation: 20,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (ctx) => BlocProvider.value(
                                value: BlocProvider.of<
                                    GetStudentsAsPersonListBloc>(context)
                                  ..add(GetStudentsAsPersonListLoadingEvent()),
                                child: SelectStudentScreen()));
                        if (x != null) {
                          x = x as PersonListVm;
                          var isExist = bodyBuildingPlanTypeFormVm.students!
                              .where((element) =>
                                  element.userFullName == x.userFullName)
                              .toList();
                          if (isExist.isEmpty) {
                            bodyBuildingPlanTypeFormVm.students!.add(x);
                            setState(() {});
                          }
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: padding),
                        padding: EdgeInsets.symmetric(
                            horizontal: padding, vertical: padding),
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
                                  size:
                                      kFontSizeText(sizeScreen, FontSize.title),
                                  color: Color(0xff48CAE4),
                                ),
                                SizedBox(
                                  width: padding / 2,
                                ),
                                Text(
                                  'افزودن شاگرد',
                                  style: textStyle.copyWith(
                                    color: Color(0xff48CAE4),
                                    fontSize: kFontSizeText(
                                        sizeScreen, FontSize.subTitle),
                                  ),
                                )
                              ],
                            ),
                            Icon(
                              Icons.person_add_alt_rounded,
                              size: kFontSizeText(sizeScreen, FontSize.title),
                              color: Color(0xff48CAE4),
                            )
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
                      children: bodyBuildingPlanTypeFormVm.students != null &&
                              bodyBuildingPlanTypeFormVm.students!.isNotEmpty
                          ? List.generate(
                              bodyBuildingPlanTypeFormVm.students!.length,
                              (index) => AddedStudent(
                                    personListVm: bodyBuildingPlanTypeFormVm
                                        .students![index],
                                    removeItem: (PersonListVm personListVm) {
                                      bodyBuildingPlanTypeFormVm.students!
                                          .remove(personListVm);
                                      setState(() {});
                                    },
                                  ))
                          : [Container()],
                    ),
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
                        if (_createBodyKey.currentState!.validate()) {
                          bodyBuildingPlanTypeFormVm.dayTerms = [
                            BodyBuildingPlanDayTermVm(
                                dayNumber: 1, termsCount: 1, currentTerm: 1)
                          ];
                          bodyBuildingPlanTypeFormVm.title =
                              _titleTextEditingController.text;
                          bodyBuildingPlanTypeFormVm.totalPrice = int.tryParse(
                              _priceTextEditingController.text.isEmpty
                                  ? '0'
                                  : _priceTextEditingController.text);
                          bodyBuildingPlanTypeFormVm.nStartDate =
                              _startDateTextEditingController.text;
                          bodyBuildingPlanTypeFormVm.nEndDate =
                              _endDateTextEditingController.text;
                          bodyBuildingPlanTypeFormVm.description =
                              _descriptionTextEditingController.text;
                          bodyBuildingPlanTypeFormVm.isPrivate = true;
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pushNamed(
                              CreateProgramBodySettingPage.routeName,
                              arguments: bodyBuildingPlanTypeFormVm);
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
