import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/BodyBuildingMovement/BodyBuildingMovementVm.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanType/BodyBuildingPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanTypeDetail/BodyBuildingPlanDayTermVm.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanTypeDetail/BodyBuildingPlanTypeDetailsFormVm.dart';
import 'package:gym_app/blocs/BodyBuildingMovement/bloc/get_user_body_building_movement_list_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovementOtherSports/create_movement_other_sports_page.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class CreateMovementPage extends StatefulWidget {
  static const routeName = '/CreateMovementPage';
  const CreateMovementPage(
      {Key? key,
      required this.bodyBuildingPlanDayTermVmOriginal,
      required this.bodyBuildingPlanTypeFormVmOriginal})
      : super(key: key);
  final BodyBuildingPlanDayTermVm bodyBuildingPlanDayTermVmOriginal;
  final BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVmOriginal;

  @override
  _CreateMovementPageState createState() => _CreateMovementPageState();
}

class _CreateMovementPageState extends State<CreateMovementPage> {
  bool isEmptyTextField = true;
  late BodyBuildingPlanDayTermVm bodyBuildingPlanDayTermVm;
  late BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm;
  @override
  void initState() {
    super.initState();
    bodyBuildingPlanDayTermVm = widget.bodyBuildingPlanDayTermVmOriginal;
    bodyBuildingPlanTypeFormVm = widget.bodyBuildingPlanTypeFormVmOriginal;
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kColorAppbar,
      appBar: AppBarWidget(
        title: bodyBuildingPlanDayTermVm.dayNumber != 3
            ? 'روز ${bodyBuildingPlanDayTermVm.dayNumber.toString().toWord()}م'
            : 'روز سوم',
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
                        bodyBuildingPlanDayTermVm.termsCount!,
                        (index) => ItemFilterChip(
                            index: index + 1,
                            onChangeValue: () {
                              setState(() {
                                bodyBuildingPlanDayTermVm.currentTerm =
                                    index + 1;
                              });
                            },
                            deleteItemfunc: (idx) {
                              if (bodyBuildingPlanDayTermVm.termsCount! > 1) {
                                bodyBuildingPlanTypeFormVm
                                    .bodyBuildingPlanTypeDetails!
                                    .removeWhere((s) => s.termNumber == idx);
                                for (var item in bodyBuildingPlanTypeFormVm
                                    .bodyBuildingPlanTypeDetails!
                                    .where((element) =>
                                        element.termNumber! > idx)) {
                                  item.termNumber = item.termNumber! - 1;
                                }
                                bodyBuildingPlanDayTermVm.termsCount =
                                    bodyBuildingPlanDayTermVm.termsCount! - 1;
                                bodyBuildingPlanDayTermVm.currentTerm = 1;

                                setState(() {});
                              }
                            },
                            isSelected: bodyBuildingPlanDayTermVm.currentTerm!),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (listCurrentDayCurrentTerm(2).isEmpty) {
                          createBodyBuildingPlanTypeDetailFormVm(false);
                          bodyBuildingPlanDayTermVm.termsCount =
                              bodyBuildingPlanDayTermVm.termsCount! + 1;
                          setState(() {});
                        } else
                          Fluttertoast.showToast(
                              msg: 'آیتم های نوبت فعلی را پر کنید');
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
                          (index) => ItemAddedMovementBodyBuilding(
                                bodyBuildingPlanTypeFormVm:
                                    bodyBuildingPlanTypeFormVm,
                                bodyBuildingPlanDayTermVm:
                                    bodyBuildingPlanDayTermVm,
                                deleteMovement: (int displayOrder) {
                                  if (listCurrentDayCurrentTerm(1).length > 1) {
                                    FocusScope.of(context).unfocus();
                                    setState(() {
                                      bodyBuildingPlanTypeFormVm
                                          .bodyBuildingPlanTypeDetails!
                                          .removeWhere((s) =>
                                              s.displayOrder == displayOrder);
                                    });
                                  } else {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    Fluttertoast.showToast(
                                        msg:
                                            'نوبت شما باید حداقل یک حرکت داشته باشد');
                                  }
                                },
                                data: listCurrentDayCurrentTerm(1)[index],
                              )),
                    ),
              GestureDetector(
                onTap: () {
                  if (listCurrentDayCurrentTerm(2).isEmpty) {
                    createBodyBuildingPlanTypeDetailFormVm(true);
                    setState(() {});
                  } else
                    Fluttertoast.showToast(msg: 'حرکت فعلی رو پر کنید');
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
                    title: 'ثبت برنامه',
                    onTap: () async {
                      List<BodyBuildingPlanTypeDetailsFormVm> x =
                          bodyBuildingPlanTypeFormVm
                              .bodyBuildingPlanTypeDetails!
                              .where((element) =>
                                  element.dayNumber ==
                                  bodyBuildingPlanDayTermVm.dayNumber)
                              .toList();
                      if (x.isNotEmpty) {
                        registerProgramDay(x);
                        if (!isEmptyTextField) {
                          await Get.showSnackbar(GetBar(
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.black,
                            snackStyle: SnackStyle.FLOATING,
                            message:
                                'برنامه ی روز ${bodyBuildingPlanDayTermVm.dayNumber.toString().toWord()}م ثبت شد',
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

  void createBodyBuildingPlanTypeDetailFormVm(bool isNewMovement) {
    BodyBuildingPlanTypeDetailsFormVm data =
        BodyBuildingPlanTypeDetailsFormVm();
    data.descriptionController = TextEditingController();
    data.nameMovementController = TextEditingController();
    data.setController = TextEditingController();
    data.dayNumber = bodyBuildingPlanDayTermVm.dayNumber;
    data.termNumber = isNewMovement
        ? bodyBuildingPlanDayTermVm.currentTerm
        : bodyBuildingPlanDayTermVm.currentTerm! + 1;
    data.displayOrder = MyHomePage.lastDisplayOtherSports += 1;
    bodyBuildingPlanTypeFormVm.bodyBuildingPlanTypeDetails!
        .removeWhere((s) => s.displayOrder == data.displayOrder);
    bodyBuildingPlanTypeFormVm.bodyBuildingPlanTypeDetails!.add(data);
  }

  List<BodyBuildingPlanTypeDetailsFormVm> listCurrentDayCurrentTerm(int type) {
    if (type == 1) {
      return bodyBuildingPlanTypeFormVm.bodyBuildingPlanTypeDetails!
          .where((s) =>
              s.dayNumber == bodyBuildingPlanDayTermVm.dayNumber &&
              s.termNumber == bodyBuildingPlanDayTermVm.currentTerm)
          .toList();
    } else
      return bodyBuildingPlanTypeFormVm.bodyBuildingPlanTypeDetails!
          .where((s) =>
              s.dayNumber == bodyBuildingPlanDayTermVm.dayNumber &&
              s.termNumber == bodyBuildingPlanDayTermVm.currentTerm &&
              (s.nameMovementController!.text.isEmpty ||
                  s.setController!.text.isEmpty ||
                  s.listSetItemsTextController!
                      .any((element) => element.text.isEmpty)))
          .toList();
  }

  void registerProgramDay(List<BodyBuildingPlanTypeDetailsFormVm> x) {
    List<BodyBuildingPlanTypeDetailsFormVm> newSuperMoves = [];
    List<TextEditingController> newListTextEditing = [];
    x.forEach((element) {
      if (element.superMoves != null && element.superMoves!.isNotEmpty)
        element.superMoves!.forEach((ss) {
          newSuperMoves.add(ss);
        });
    });
    newSuperMoves.forEach((element) {
      if (element.listSetItemsTextController != null &&
          element.listSetItemsTextController!.isNotEmpty)
        element.listSetItemsTextController!.forEach((ss) {
          newListTextEditing.add(ss);
        });
    });

    for (int i = 0; i < x.length; i++) {
      if (x[i].nameMovementController!.text.isEmpty) {
        Fluttertoast.showToast(
            msg:
                'نام حرکت در روز ${x[i].dayNumber.toString().toWord()}م و نوبت ${x[i].termNumber.toString().toWord()}م خالی است');
        isEmptyTextField = true;
        return;
      } else if (x[i].setController!.text.isEmpty) {
        Fluttertoast.showToast(
            msg:
                'نام ست در روز ${x[i].dayNumber.toString().toWord()}م و نوبت ${x[i].termNumber.toString().toWord()}م خالی است');
        isEmptyTextField = true;
        return;
      } else if (x[i].listSetItemsTextController != null &&
          x[i].listSetItemsTextController!.isNotEmpty &&
          x[i]
              .listSetItemsTextController!
              .any((element) => element.text.isEmpty)) {
        Fluttertoast.showToast(msg: 'لطفا ست های ایجاد شده را پر کنید');
        isEmptyTextField = true;
        return;
      }
      //********************** check for super */

      isEmptyTextField = false;
    }
    for (int i = 0; i < newSuperMoves.length; i++) {
      if (newSuperMoves[i].nameMovementController!.text.isEmpty) {
        Fluttertoast.showToast(
            msg:
                'نام حرکت در روز ${x[i].superMoves![i].dayNumber.toString().toWord()}م و نوبت ${x[i].superMoves![i].termNumber.toString().toWord()}م خالی است');
        isEmptyTextField = true;
        return;
      } else if (newSuperMoves[i].setController!.text.isEmpty) {
        Fluttertoast.showToast(
            msg:
                'نام ست در روز ${x[i].superMoves![i].dayNumber.toString().toWord()}م و نوبت ${x[i].superMoves![i].termNumber.toString().toWord()}م خالی است');
        isEmptyTextField = true;
        return;
      } else if (newSuperMoves[i].listSetItemsTextController != null &&
          newSuperMoves[i].listSetItemsTextController!.isNotEmpty &&
          newSuperMoves[i]
              .listSetItemsTextController!
              .any((element) => element.text.isEmpty)) {
        Fluttertoast.showToast(msg: 'لطفا ست های ایجاد شده را پر کنید');
        isEmptyTextField = true;
        return;
      }
      //********************** check for super */

      isEmptyTextField = false;
    }
  }
}

class ItemAddedMovementBodyBuilding extends StatefulWidget {
  const ItemAddedMovementBodyBuilding(
      {Key? key,
      required this.data,
      required this.deleteMovement,
      required this.bodyBuildingPlanTypeFormVm,
      required this.bodyBuildingPlanDayTermVm})
      : super(key: key);
  final BodyBuildingPlanTypeDetailsFormVm data;
  final Function deleteMovement;
  final BodyBuildingPlanDayTermVm bodyBuildingPlanDayTermVm;
  final BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm;

  @override
  _ItemAddedMovementBodyBuildingState createState() =>
      _ItemAddedMovementBodyBuildingState();
}

class _ItemAddedMovementBodyBuildingState
    extends State<ItemAddedMovementBodyBuilding> {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ItemAddedSuperMovement(
                              deleteMovement: widget.deleteMovement,
                              data: widget.data),
                          Padding(
                            padding: EdgeInsets.only(left: padding),
                            child: Column(
                                children: widget.data.superMoves != null &&
                                        widget.data.superMoves!.isNotEmpty
                                    ? List.generate(
                                        widget.data.superMoves!.length,
                                        (index) => ItemAddedSuperMovement(
                                              deleteMovement: (int index) {
                                                FocusScope.of(context)
                                                    .unfocus();
                                                setState(() {
                                                  widget.data.superMoves!
                                                      .removeWhere((s) =>
                                                          s.displayOrder ==
                                                          index);
                                                });
                                              },
                                              data: widget
                                                  .data.superMoves![index],
                                            ))
                                    : [Container()]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: CustomeButton(
                              sizeScreen: sizeScreen,
                              title: 'حرکت سوپری',
                              onTap: () {
                                BodyBuildingPlanTypeDetailsFormVm
                                    bodybuildingNewInstance =
                                    BodyBuildingPlanTypeDetailsFormVm();
                                bodybuildingNewInstance.descriptionController =
                                    TextEditingController();
                                bodybuildingNewInstance.nameMovementController =
                                    TextEditingController();
                                bodybuildingNewInstance.setController =
                                    TextEditingController();
                                bodybuildingNewInstance.dayNumber =
                                    widget.bodyBuildingPlanDayTermVm.dayNumber;
                                bodybuildingNewInstance.termNumber = widget
                                    .bodyBuildingPlanDayTermVm.currentTerm;
                                bodybuildingNewInstance.displayOrder =
                                    MyHomePage.lastDisplayOtherSports += 1;
                                widget.bodyBuildingPlanTypeFormVm
                                    .bodyBuildingPlanTypeDetails!
                                    .removeWhere((s) =>
                                        s.displayOrder ==
                                        bodybuildingNewInstance.displayOrder);
                                if (widget.data.superMoves != null)
                                  widget.data.superMoves!
                                      .add(bodybuildingNewInstance);
                                else {
                                  widget.data.superMoves = [];
                                  widget.data.superMoves!
                                      .add(bodybuildingNewInstance);
                                }
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ))),
            )));
  }
}

class ItemAddedSuperMovement extends StatefulWidget {
  const ItemAddedSuperMovement(
      {Key? key, required this.deleteMovement, required this.data})
      : super(key: key);
  final Function deleteMovement;
  final BodyBuildingPlanTypeDetailsFormVm data;

  @override
  _ItemAddedSuperMovementState createState() => _ItemAddedSuperMovementState();
}

class _ItemAddedSuperMovementState extends State<ItemAddedSuperMovement> {
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 15),
            width: 3,
            decoration: BoxDecoration(
              color: parseColor('#48CAE4'),
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30), bottom: Radius.circular(30)),
            ),
            height: 200,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20, right: padding),
                      child: GestureDetector(
                        onTap: () async {
                          FocusScope.of(context).unfocus();
                          var x = await showModalBottomSheet(
                              isScrollControlled: true,
                              isDismissible: true,
                              elevation: 20,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (ctx) => BlocProvider.value(
                                  value: BlocProvider.of<
                                          GetUserBodyBuildingMovementListBloc>(
                                      context),
                                  child: SelectMovement()));
                          if (x != null)
                            widget.data.nameMovementController!.text = x;
                        },
                        child: TextFormField(
                          readOnly: true,
                          enabled: false,
                          keyboardType: TextInputType.text,
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.subTitle)),
                          controller: widget.data.nameMovementController,
                          decoration: InputDecoration(
                              hintText: 'نام حرکت',
                              hintStyle: textStyle.copyWith(
                                  color: Colors.black45,
                                  fontSize: kFontSizeText(
                                      sizeScreen, FontSize.subTitle))),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: GestureDetector(
                            onTap: () {
                              widget.deleteMovement(widget.data.displayOrder);
                            },
                            child: SvgPicture.asset(
                              'assets/icons/deleteIcon.svg',
                              width: 20,
                              height: 20,
                            ),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        color: Colors.black12,
                        width: 30,
                        height: 1,
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin:
                    EdgeInsets.only(bottom: 20, right: padding, left: padding),
                width: 30,
                child: TextField(
                  controller: widget.data.setController,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.phone,
                  onChanged: (String value) {
                    widget.data.setCount = int.tryParse(value) ?? 0;
                    if (widget.data.setCount! < 10) {
                      widget.data.listSetItemsTextController = [];
                      for (int i = 0; i < widget.data.setCount!; i++) {
                        widget.data.listSetItemsTextController!
                            .add(TextEditingController());
                      }

                      setState(() {});
                    } else {
                      setState(() {
                        widget.data.setCount = 0;
                      });
                    }
                  },
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintText: 'ست',
                      hintStyle: textStyle.copyWith(
                          color: Colors.black45,
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle))),
                ),
              ),
              Wrap(
                  children: widget.data.setCount != null
                      ? List.generate(
                          widget.data.setCount!,
                          (index) => Container(
                                margin:
                                    EdgeInsets.symmetric(horizontal: padding),
                                width: 30,
                                child: TextField(
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: widget
                                      .data.listSetItemsTextController![index],
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      hintStyle: textStyle.copyWith(
                                          color: Colors.black45),
                                      hintText: (index + 1).toString()),
                                ),
                              ))
                      : [Container()]),
              Container(
                margin: EdgeInsets.only(
                    bottom: 20, right: padding, left: padding, top: 30),
                child: TextField(
                  style: textStyle.copyWith(
                      fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
                  controller: widget.data.descriptionController,
                  decoration: InputDecoration(
                      hintText: 'توضیحات حرکت',
                      hintStyle: textStyle.copyWith(
                          color: Colors.black45,
                          fontSize:
                              kFontSizeText(sizeScreen, FontSize.subTitle))),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class SelectMovement extends StatefulWidget {
  @override
  _SelectMovementState createState() => _SelectMovementState();
}

class _SelectMovementState extends State<SelectMovement> {
  @override
  void initState() {
    BlocProvider.of<GetUserBodyBuildingMovementListBloc>(context)
        .add(GetUserBodyBuildingMovementListLoadingEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        reverse: true,
        child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6),
            decoration: BoxDecoration(
                color: kColorBackGround,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: padding,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.circular(10)),
                  width: sizeScreen.width * 0.1,
                  height: 5,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: padding),
                  child: Center(
                    child: Text(
                      'جستجوی حرکت',
                      style: textStyle.copyWith(
                          fontSize: kFontSizeText(sizeScreen, FontSize.title),
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 20, right: 20, left: 20, top: 20),
                  child: TextField(
                      onChanged: (String value) {
                        BlocProvider.of<GetUserBodyBuildingMovementListBloc>(
                                context)
                            .add(GetUserBodyBuildingMovementListLoadingEvent(
                                searchText: value));
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: padding / 2, horizontal: padding),
                          hintText: 'جستجوی حرکت',
                          hintStyle: textStyle.copyWith(
                              color: Color(0xff707070), fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide:
                                  BorderSide(color: Color(0xff707070))))),
                ),
                Expanded(child: BlocBuilder<GetUserBodyBuildingMovementListBloc,
                    GetUserBodyBuildingMovementListState>(
                  builder: (context, state) {
                    if (state is GetUserBodyBuildingMovementListLoadingState)
                      return Center(
                        child: MyWaiting(),
                      );
                    else if (state
                        is GetUserBodyBuildingMovementListLoadedState) {
                      if (state.listBodyBuildingMovement != null &&
                          state.listBodyBuildingMovement!.isNotEmpty)
                        return ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ItemSelectMovement(
                                  bodyBuildingMovementVm:
                                      state.listBodyBuildingMovement![index],
                                ),
                            separatorBuilder: (context, index) => Divider(
                                  color: Colors.black38,
                                ),
                            itemCount: state.listBodyBuildingMovement!.length);
                      else
                        return NoData();
                    }
                    return Container();
                  },
                ))
              ],
            )),
      ),
    );
  }
}

class ItemSelectMovement extends StatelessWidget {
  final BodyBuildingMovementVm bodyBuildingMovementVm;
  ItemSelectMovement({required this.bodyBuildingMovementVm});
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop(bodyBuildingMovementVm.title);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: padding),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            alignment: Alignment.centerRight,
            child: Text(
              bodyBuildingMovementVm.title ?? "",
              style: textStyle.copyWith(
                  fontSize: kFontSizeText(sizeScreen, FontSize.title)),
            ),
          ),
        ),
      ),
    );
  }
}
