import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/blocs/AnonymousPlanType/bloc/find_by_id_in_form_other_sports_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customeTextField.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/screen/CreateProgramOtherSports/create_program_other_sports_page.dart';
import 'package:gym_app/screen/CreateProgramOtherSportsSetting/create_program_other_sports_setting_pages.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class EditProgramOtherSportsPage extends StatefulWidget {
  EditProgramOtherSportsPage({Key? key}) : super(key: key);
  static const String routeName = '/EditProgramOtherSports';

  @override
  _EditProgramOtherSportsPageState createState() =>
      _EditProgramOtherSportsPageState();
}

class _EditProgramOtherSportsPageState
    extends State<EditProgramOtherSportsPage> {
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
  final GlobalKey<FormState> _editOtherSportKey = GlobalKey<FormState>();

  AnonymousPlantypeFormVm anonymousPlantypeFormVm = AnonymousPlantypeFormVm();

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: 'ویرایش برنامه سایر رشته ها',
      ),
      body: Container(
        height: sizeScreen.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<FindByIdInFormOtherSportsBloc,
              FindByIdInFormOtherSportsState>(
            listener: (context, state) {
              if (state is FindByIdInFormOtherSportsLoadedState) {
                if (state.resultObject != null &&
                    state.resultObject!.success!) {
                  anonymousPlantypeFormVm = AnonymousPlantypeFormVm.fromJson(
                      state.resultObject!.extra! as Map<String, dynamic>);
                  _descriptionTextEditingController.text =
                      anonymousPlantypeFormVm.description ?? "";
                  _endDateTextEditingController.text =
                      anonymousPlantypeFormVm.nEndDate ?? "";
                  _priceTextEditingController.text =
                      anonymousPlantypeFormVm.totalPrice.toString();
                  _startDateTextEditingController.text =
                      anonymousPlantypeFormVm.nStartDate ?? "";
                  _titleTextEditingController.text =
                      anonymousPlantypeFormVm.title ?? "";
                } else if (state.resultObject != null)
                  Fluttertoast.showToast(msg: state.resultObject!.message!);
              }
            },
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: Duration(seconds: 1),
                child: state is FindByIdInFormOtherSportsLoadingState
                    ? MyWaiting()
                    : state is FindByIdInFormOtherSportsLoadedState &&
                            state.resultObject != null &&
                            state.resultObject!.success!
                        ? ItemLoadedEditingProgramOtherSports(
                            anonymousPlantypeFormVm: anonymousPlantypeFormVm,
                            descriptionTextEditingController:
                                _descriptionTextEditingController,
                            endDateTextEditingController:
                                _endDateTextEditingController,
                            priceTextEditingController:
                                _priceTextEditingController,
                            startDateTextEditingController:
                                _startDateTextEditingController,
                            titleTextEditingController:
                                _titleTextEditingController,
                            editOtherSportKey: _editOtherSportKey,
                          )
                        : Container(),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ItemLoadedEditingProgramOtherSports extends StatelessWidget {
  ItemLoadedEditingProgramOtherSports(
      {Key? key,
      required this.anonymousPlantypeFormVm,
      required this.priceTextEditingController,
      required this.titleTextEditingController,
      required this.startDateTextEditingController,
      required this.descriptionTextEditingController,
      required this.endDateTextEditingController,
      required this.editOtherSportKey})
      : super(key: key);
  final AnonymousPlantypeFormVm anonymousPlantypeFormVm;
  final TextEditingController priceTextEditingController;
  final TextEditingController titleTextEditingController;
  final TextEditingController startDateTextEditingController;
  final TextEditingController endDateTextEditingController;
  final TextEditingController descriptionTextEditingController;
  final GlobalKey<FormState> editOtherSportKey;
  Future<void> setStartTimePicker(BuildContext context) async {
    var x = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1400, 1, 8),
      lastDate: Jalali(1405, 12),
    );
    if (x != null) {
      startDateTextEditingController.text = x.toJalaliDateTime().split(' ')[0];
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
      endDateTextEditingController.text = x.toJalaliDateTime().split(' ')[0];
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;

    return Form(
      key: editOtherSportKey,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: padding * 2, vertical: padding),
        decoration: kBodyDecoration,
        constraints: BoxConstraints(minHeight: sizeScreen.height),
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: sizeScreen.width * 0.8,
            child: Column(
              children: [
                TextFormField(
                  validator: (String? value) {},
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (String value) {},
                  controller: priceTextEditingController,
                  decoration: kInputDecorationTextField.copyWith(
                      hintStyle: textStyle.copyWith(
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle),
                          color: kHintText),
                      hintText: 'هزینه',
                      suffix: Container(
                        width: sizeScreen.width * 0.4,
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
                                  if (priceTextEditingController.text.isEmpty)
                                    priceTextEditingController.text = '0';
                                  int x = int.parse(
                                      priceTextEditingController.text);
                                  x += 100000;
                                  priceTextEditingController.text =
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
                          width: sizeScreen.width * 0.2,
                          padding: EdgeInsets.symmetric(horizontal: padding),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  if (priceTextEditingController
                                          .text.isNotEmpty &&
                                      int.tryParse(priceTextEditingController
                                              .text)! >=
                                          100000) {
                                    int x = int.parse(
                                        priceTextEditingController.text);
                                    x -= 100000;
                                    priceTextEditingController.text =
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
                    if (value.isEmpty) return 'نام برنامه نمیتواند خالی باشد';
                    return null;
                  },
                  onSubmited: (String value) {},
                  textEditingController: titleTextEditingController,
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
                      if (value.isEmpty) return 'تاریخ شروع نمیتواند خالی باشد';
                      return null;
                    },
                    onSubmited: (String value) {},
                    textEditingController: startDateTextEditingController,
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
                    textEditingController: endDateTextEditingController,
                    isReadOnly: true,
                    isEnable: false,
                    hintText: 'تاریخ پایان',
                  ),
                ),
                SizedBox(height: padding * 2),
                CurrentUserVm.roleType != 3
                    ? ItemAddedStudents(
                        anonymousPlantypeFormVm: anonymousPlantypeFormVm,
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
                    controller: descriptionTextEditingController,
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
                        fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                  ),
                ),
                SizedBox(
                  height: padding,
                ),
                CustomeButton(
                  sizeScreen: sizeScreen,
                  title: 'ادامه',
                  onTap: () {
                    if (editOtherSportKey.currentState!.validate()) {
                      anonymousPlantypeFormVm.isCreate = false;
                      anonymousPlantypeFormVm.title =
                          titleTextEditingController.text;
                      anonymousPlantypeFormVm.totalPrice = int.tryParse(
                          priceTextEditingController.text.isEmpty
                              ? '0'
                              : priceTextEditingController.text);
                      anonymousPlantypeFormVm.nStartDate =
                          startDateTextEditingController.text;
                      anonymousPlantypeFormVm.nEndDate =
                          endDateTextEditingController.text;
                      anonymousPlantypeFormVm.description =
                          descriptionTextEditingController.text;
                      FocusScope.of(context).unfocus();
                      Navigator.of(context).pushNamed(
                          CreateProgramOtherSportsSettingPage.routeName,
                          arguments: anonymousPlantypeFormVm);
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
