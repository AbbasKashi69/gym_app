import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeDayMealVm.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/blocs/DietPlanType/bloc/create_using_form_diet_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovementDiet/create_movement_diet_page.dart';
import 'package:gym_app/screen/CreateMovementOtherSports/create_movement_other_sports_page.dart';
import 'package:gym_app/screen/CreateProgramOtherSportsSetting/create_program_other_sports_setting_pages.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CreateProgramDietSettingPage extends StatelessWidget {
  static const routeName = '/CreateProgramDietSettingPage';
  CreateProgramDietSettingPage({Key? key, required this.dietPlanTypeFormVm})
      : super(key: key);
  final DietPlanTypeFormVm? dietPlanTypeFormVm;

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
                            'ایجاد برنامه غذایی',
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
              dietPlanTypeFormVm: dietPlanTypeFormVm!,
            )
          ],
        ),
      ),
    );
  }
}

class DaysTask extends StatefulWidget {
  const DaysTask(
      {Key? key, required this.sizeScreen, required this.dietPlanTypeFormVm})
      : super(key: key);

  final Size sizeScreen;
  final DietPlanTypeFormVm dietPlanTypeFormVm;

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
                    widget.dietPlanTypeFormVm.dayMeals!.length,
                    (index) => Material(
                          color: Colors.transparent,
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                // widget.dietPlanTypeFormVm
                                //     .anonymousPlanTypeDetailForms = [];
                                // MyHomePage.lastDisplayOtherSports = 0;
                                MyDietVm myVm = MyDietVm(
                                    dietPlanTypeDayMealVm: widget
                                        .dietPlanTypeFormVm.dayMeals![index],
                                    dietPlanTypeFormVm:
                                        widget.dietPlanTypeFormVm);
                                Navigator.of(context).pushNamed(
                                    CreateMovementDietPage.routeName,
                                    arguments: myVm);
                              },
                              child: ItemDay(
                                  title: widget.dietPlanTypeFormVm
                                      .dayMeals![index].dayNumber
                                      .toString()
                                      .toWord(),
                                  deleteItem: () {
                                    widget.dietPlanTypeFormVm.dayMeals!
                                        .removeAt(index);
                                    widget.dietPlanTypeFormVm
                                        .dietPlanTypeDetailForms!
                                        .removeWhere((element) =>
                                            element.dayNumber == index + 1);
                                    for (var item in widget.dietPlanTypeFormVm
                                        .dietPlanTypeDetailForms!
                                        .where((element) =>
                                            element.dayNumber! > index)) {
                                      item.dayNumber = item.dayNumber! - 1;
                                    }
                                    for (var item in widget
                                        .dietPlanTypeFormVm.dayMeals!
                                        .where((element) =>
                                            element.dayNumber! > index)) {
                                      item.dayNumber = item.dayNumber! - 1;
                                    }

                                    setState(() {});
                                  }),
                            ),
                          ),
                        )),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.dietPlanTypeFormVm.dayMeals!.add(
                        DietPlanTypeDayMealVm(
                            currentTerm: 1,
                            mealsCount: 1,
                            dayNumber:
                                widget.dietPlanTypeFormVm.dayMeals!.length +
                                    1));
                  });
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
              BlocConsumer<CreateUsingFormDietBloc, CreateUsingFormDietState>(
                listener: (context, state) async {
                  if (state is CreateUsingFormDietLoadedState) {
                    if (state.resultObject != null &&
                        state.resultObject!.success!) {
                      await Fluttertoast.showToast(
                          msg: state.resultObject!.message!);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          MyHomePage.routeName, (route) => false);
                    } else if (state.resultObject != null)
                      Fluttertoast.showToast(msg: state.resultObject!.message!);
                    else
                      Fluttertoast.showToast(msg: 'دوباره امتحان کنید');
                  }
                },
                builder: (context, state) {
                  if (state is CreateUsingFormDietLoadingState)
                    return MyWaiting();
                  else
                    return CustomeButton(
                        sizeScreen: widget.sizeScreen,
                        title: "ثبت",
                        onTap: () {
                          if (widget.dietPlanTypeFormVm.dayMeals!.isNotEmpty &&
                              widget.dietPlanTypeFormVm.dietPlanTypeDetailForms!
                                  .isNotEmpty &&
                              widget.dietPlanTypeFormVm.dietPlanTypeDetailForms!
                                  .where((element) => element
                                      .nameDietController!.text.isNotEmpty)
                                  .toList()
                                  .isNotEmpty) {
                            BlocProvider.of<CreateUsingFormDietBloc>(context)
                                .add(CreateUsingFormDietLoadingEvent(
                                    dietPlanTypeFormVm:
                                        widget.dietPlanTypeFormVm));
                          } else
                            Fluttertoast.showToast(
                                msg: 'برنامه باید حداقل یک آیتم داشته باشد');
                        });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyDietVm {
  final DietPlanTypeFormVm dietPlanTypeFormVm;
  final DietPlanTypeDayMealVm dietPlanTypeDayMealVm;
  MyDietVm(
      {required this.dietPlanTypeDayMealVm, required this.dietPlanTypeFormVm});
}
