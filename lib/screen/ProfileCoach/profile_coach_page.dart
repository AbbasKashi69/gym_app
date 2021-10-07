import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentProfileVm.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:gym_app/ViewModels/Person/PersonVm.dart';
import 'package:gym_app/ViewModels/UserFlow/UserFlowVm.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_coach_student_profile_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/request_to_coach_bloc.dart';
import 'package:gym_app/blocs/UserFlow/bloc/create_user_flow_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customeTextField.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/components/no_data.dart';
import 'package:gym_app/screen/CropPage/crop_page.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/ListCoach/components/warning_unFollow_screen.dart';
import 'package:gym_app/screen/PersonalInfoCoach/personal_info_coach_page.dart';
import 'package:gym_app/screen/ProfileCoach/components/selector_image_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import 'components/item_conversation.dart';
import 'components/no_access.dart';

class ProfileCoachPage extends StatefulWidget {
  const ProfileCoachPage({Key? key, required this.coachStudentVm})
      : super(key: key);
  static const routeName = '/ProfileCoachPage';
  final CoachStudentVm coachStudentVm;

  @override
  _ProfileCoachPageState createState() => _ProfileCoachPageState();
}

late bool isPrivate;
late bool sendReqestInBackPage;

class _ProfileCoachPageState extends State<ProfileCoachPage> {
  CoachStudentProfileVm coachStudentProfileVm = CoachStudentProfileVm();
  @override
  void initState() {
    super.initState();
    isPrivate = true;
    sendReqestInBackPage = false;
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(sendReqestInBackPage);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: kColorAppbar,
        appBar: AppBarWidget(
          title: 'پروفایل مربی',
          onBack: () {
            Navigator.of(context).pop(sendReqestInBackPage);
          },
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
              // constraints: BoxConstraints(minHeight: sizeScreen.height),
              // height: sizeScreen.height - kToolbarHeight,
              padding: EdgeInsets.symmetric(horizontal: padding),
              decoration: kBodyDecoration,
              child: BlocConsumer<GetCoachStudentProfileBloc,
                  GetCoachStudentProfileState>(
                listener: (context, state) {
                  if (state is GetCoachStudentProfileLoadedState) {
                    if (state.resultObject != null) {
                      if (state.resultObject!.success!) {
                        coachStudentProfileVm = CoachStudentProfileVm.fromJson(
                            state.resultObject!.extra as Map<String, dynamic>);
                        setState(() {
                          isPrivate = false;
                        });
                      } else {
                        coachStudentProfileVm = CoachStudentProfileVm.fromJson(
                            state.resultObject!.extra as Map<String, dynamic>);
                      }
                    }
                  }
                },
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: state is GetCoachStudentProfileLoadingState
                        ? MyWaiting()
                        : state is GetCoachStudentProfileLoadedState &&
                                state.resultObject != null
                            ? Body(
                                sizeScreen: sizeScreen,
                                coachStudentProfileVm: coachStudentProfileVm,
                                coachStudentVm: widget.coachStudentVm,
                              )
                            : state is GetCoachStudentProfileLoadedState &&
                                    state.resultObject == null
                                ? Center(child: NoData())
                                : Container(),
                  );
                },
              )),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  Body(
      {Key? key,
      required this.sizeScreen,
      required this.coachStudentProfileVm,
      required this.coachStudentVm})
      : super(key: key);

  final Size sizeScreen;
  final CoachStudentProfileVm coachStudentProfileVm;
  final CoachStudentVm coachStudentVm;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final TextEditingController weightTextController = TextEditingController();

  final TextEditingController heightTextController = TextEditingController();

  final TextEditingController trainingTimeTextController =
      TextEditingController();

  final TextEditingController exercisePlanTextController =
      TextEditingController();

  final TextEditingController dietPlanTextController = TextEditingController();

  final TextEditingController descriptionTextController =
      TextEditingController();

  final GlobalKey<FormState> _createUserFllowKey = GlobalKey<FormState>();
  late String setTime;
  late String timeForSend;
  @override
  void initState() {
    Jalali? jalali = Jalali.now();
    setTime = jalali.formatFullDate();
    timeForSend = jalali.toJalaliDateTime().split(' ')[0];
    super.initState();
  }

  Future<bool> changeDate(BuildContext context) async {
    var x = await showPersianDatePicker(
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1400, 1, 8),
      lastDate: Jalali(1405, 12),
    );
    if (x != null) {
      setTime = x.formatFullDate();
      timeForSend = x.toJalaliDateTime().split(' ')[0];
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      child: Form(
        key: _createUserFllowKey,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: padding, bottom: padding * 2, right: padding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: widget.sizeScreen.width > 550 ? 30 : 20,
                        backgroundImage: NetworkImage(
                            widget.coachStudentProfileVm.userPic ?? ""),
                      ),
                      SizedBox(
                        width: padding,
                      ),
                      RichText(
                          text: TextSpan(
                              text: widget.coachStudentProfileVm.userFullName,
                              style: textStyle.copyWith(
                                  fontSize: kFontSizeText(
                                      widget.sizeScreen, FontSize.subTitle)),
                              children: [
                            TextSpan(
                                text: ' (مربی)',
                                style: textStyle.copyWith(
                                    fontSize: kFontSizeText(
                                        widget.sizeScreen, FontSize.subTitle),
                                    color: Color(0xff5e5e5e)))
                          ])),
                      Spacer(),
                      isPrivate
                          ? Container()
                          : BlocConsumer<RequestToCoachBloc,
                              RequestToCoachState>(
                              listener: (context, state) {
                                if (state is RequestToCoachLoadedState) {
                                  if (state.resultObject != null) {
                                    if (state.resultObject!.success!) {
                                      Fluttertoast.showToast(
                                          msg: state.resultObject!.message!);
                                      BlocProvider.of<
                                                  GetCoachStudentProfileBloc>(
                                              context)
                                          .add(
                                              GetCoachStudentProfileLoadingEvent(
                                                  coachId: widget
                                                      .coachStudentVm.coachId,
                                                  studentId: null));
                                      sendReqestInBackPage = true;
                                      setState(() {
                                        isPrivate = true;
                                      });
                                    } else
                                      Fluttertoast.showToast(
                                          msg: state.resultObject!.message!);
                                  }
                                }
                              },
                              builder: (context, state) {
                                if (state is RequestToCoachLoadingState)
                                  return MyWaiting(
                                    size: 20,
                                  );
                                else
                                  return GestureDetector(
                                    onTap: () async {
                                      var result = await WarningUnFollowScreen()
                                          .warningUnFollow(
                                              context,
                                              widget.sizeScreen,
                                              widget.coachStudentVm
                                                      .coachFullName ??
                                                  "");
                                      if (result) {
                                        BlocProvider.of<RequestToCoachBloc>(
                                                context)
                                            .add(RequestToCoachLoadingEvent(
                                                coachId: widget
                                                    .coachStudentVm.coachId));
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: kColorBackgroundItem),
                                      child: Center(
                                          child: SvgPicture.asset(
                                              'assets/icons/trash.svg')),
                                    ),
                                  );
                              },
                            )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'برنامه تمرینی',
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.title),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          widget.coachStudentProfileVm.anonymousPlanCount
                              .toString(),
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.subTitle),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'برنامه غذایی',
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.title),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          widget.coachStudentProfileVm.dietPlanCount.toString(),
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.subTitle),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'شاگردان',
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.title),
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: padding / 2,
                        ),
                        Text(
                          widget.coachStudentProfileVm.studentCount.toString(),
                          style: textStyle.copyWith(
                              fontSize:
                                  kFontSizeText(sizeScreen, FontSize.subTitle),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    )
                  ],
                ),
                isPrivate
                    ? Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: GestureDetector(
                          onTap: () async {
                            Navigator.of(context).pushNamed(CvPage.routeName,
                                arguments: widget.coachStudentVm.coachId);
                            // await NoCvScreen().noCv(context, sizeScreen);
                          },
                          child: ItemConversation(
                            image: 'assets/icons/cv.svg',
                            title: 'رزومه',
                          ),
                        ),
                      )
                    : Container(
                        margin: EdgeInsets.only(top: padding * 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.of(context).pushNamed(
                                      CvPage.routeName,
                                      arguments: widget.coachStudentVm.coachId);
                                  // await NoCvScreen().noCv(context, sizeScreen);
                                },
                                child: ItemConversation(
                                  image: 'assets/icons/cv.svg',
                                  title: 'رزومه',
                                ),
                              ),
                            ),
                            SizedBox(
                              width: padding,
                            ),
                            // Expanded(
                            //   flex: 3,
                            //   child: GestureDetector(
                            //     onTap: () async {
                            //       await WriteProgramScreen()
                            //           .writeProgram(context, sizeScreen);
                            //     },
                            //     child: ItemConversation(
                            //       image: 'assets/icons/writeProgram.svg',
                            //       title: 'نوشتن برنامه',
                            //     ),
                            //   ),
                            // ),
                            // SizedBox(
                            //   width: padding,
                            // ),
                            Expanded(
                              flex: 2,
                              child: ItemConversation(
                                title: 'گفتگو',
                                image: 'assets/icons/conversation.svg',
                              ),
                            ),
                            Spacer(
                              flex: 3,
                            )
                          ],
                        ),
                      ),
              ],
            ),
            isPrivate
                ? Container(
                    padding: EdgeInsets.only(top: 30),
                    child: NoAccess(
                      isCoach: true,
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: padding * 2, bottom: padding),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kColorBackgroundItem),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: padding, horizontal: padding / 2),
                        child: Row(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  'assets/icons/listProgram.svg',
                                ),
                                SizedBox(
                                  width: padding,
                                ),
                                Text(
                                  'لیست برنامه ها',
                                  style: textStyle,
                                )
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          Navigator.of(context).pushNamed(
                              PersonalInfoCoachPage.routeName,
                              arguments: widget.coachStudentProfileVm);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kColorBackgroundItem),
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: padding, horizontal: padding / 2),
                          child: Row(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/personalProfile.svg',
                                  ),
                                  SizedBox(
                                    width: padding,
                                  ),
                                  Text(
                                    'مشخصات فردی',
                                    style: textStyle,
                                  )
                                ],
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: padding * 2, bottom: padding),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'ارائه گزارش به مربی',
                          style: textStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return GestureDetector(
                            onTap: () async {
                              bool checked = await changeDate(context);
                              if (checked) setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: padding, horizontal: padding / 2),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kColorBackgroundItem),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/dateBlack.svg',
                                      ),
                                      SizedBox(
                                        width: padding,
                                      ),
                                      Text(
                                        setTime,
                                        style: textStyle.copyWith(
                                            fontSize: kFontSizeText(
                                                sizeScreen, FontSize.subTitle)),
                                      )
                                    ],
                                  ),
                                  Spacer()
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: padding,
                      ),
                      CustomeTextField(
                        hintText: 'قد (سانتی متر)',
                        isHaveIcon: false,
                        textInputAction: TextInputAction.next,
                        textEditingController: heightTextController,
                        keyboardType: TextInputType.phone,
                        onSubmited: (String value) {},
                        validator: (String? value) {
                          if (value!.isEmpty) return 'فیلد بالا را پر کنید';
                          return null;
                        },
                        onChange: (String value) {},
                      ),
                      SizedBox(
                        height: padding,
                      ),
                      CustomeTextField(
                        hintText: 'وزن (کیلو گرم)',
                        isHaveIcon: false,
                        textEditingController: weightTextController,
                        keyboardType: TextInputType.phone,
                        onSubmited: (String value) {},
                        validator: (String? value) {
                          if (value!.isEmpty) return 'فیلد بالا را پر کنید';
                          return null;
                        },
                        onChange: (String value) {},
                      ),
                      SizedBox(
                        height: padding,
                      ),
                      CustomeTextField(
                        hintText: 'مدت زمان تمرین (دقیقه)',
                        isHaveIcon: true,
                        textEditingController: trainingTimeTextController,
                        keyboardType: TextInputType.phone,
                        onSubmited: (String value) {},
                        validator: (String? value) {
                          if (value!.isEmpty) return 'فیلد بالا را پر کنید';
                          return null;
                        },
                        onChange: (String value) {},
                      ),
                      SizedBox(
                        height: padding,
                      ),
                      CustomeTextField(
                        hintText: 'رعایت برنامه تمرینی (درصد)',
                        isHaveIcon: true,
                        textEditingController: exercisePlanTextController,
                        keyboardType: TextInputType.phone,
                        onSubmited: (String value) {},
                        validator: (String? value) {
                          if (value!.isEmpty) return 'فیلد بالا را پر کنید';
                          return null;
                        },
                        onChange: (String value) {},
                      ),
                      SizedBox(
                        height: padding,
                      ),
                      CustomeTextField(
                        hintText: 'رعایت برنامه غذایی (درصد)',
                        isHaveIcon: true,
                        textEditingController: dietPlanTextController,
                        keyboardType: TextInputType.phone,
                        onSubmited: (String value) {},
                        validator: (String? value) {
                          if (value!.isEmpty) return 'فیلد بالا را پر کنید';
                          return null;
                        },
                        onChange: (String value) {},
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
                          controller: descriptionTextController,
                          decoration: InputDecoration(
                              hintText: 'توضیحات',
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: padding / 2,
                                  vertical: padding / 2),
                              border: InputBorder.none),
                          minLines: 7,
                          // any number you need (It works as the rows for the textarea)
                          // maxLength: 1000,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          textAlign: TextAlign.justify,
                          style: textStyle.copyWith(
                              height: 1.5,
                              fontSize: kFontSizeText(
                                  widget.sizeScreen, FontSize.subTitle)),
                        ),
                      ),
                      ShowImageSelected(),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: BlocConsumer<CreateUserFlowBloc,
                              CreateUserFlowState>(
                            listener: (context, state) {
                              if (state is CreateUserFlowLoadedState) {
                                if (state.resultObject != null) {
                                  Fluttertoast.showToast(
                                      msg: state.resultObject!.message!);
                                }
                              }
                            },
                            builder: (context, state) {
                              if (state is CreateUserFlowLoadingState)
                                return Center(
                                  child: MyWaiting(),
                                );
                              return CustomeButton(
                                  sizeScreen: widget.sizeScreen,
                                  title: 'ثبت و ارسال',
                                  onTap: () {
                                    if (_createUserFllowKey.currentState!
                                        .validate()) {
                                      UserFlowVm userFlowVm = UserFlowVm(
                                          listFileVm: listImages,
                                          coachId: widget.coachStudentVm.coachId ??
                                              0,
                                          weight: double.tryParse(
                                                  weightTextController.text) ??
                                              0,
                                          height: double.tryParse(
                                                  heightTextController.text) ??
                                              0,
                                          trainingTime: double.tryParse(
                                                  trainingTimeTextController
                                                      .text) ??
                                              0,
                                          dietPlanFollowPercent:
                                              double.tryParse(dietPlanTextController.text) ??
                                                  0,
                                          bodyBuildingPlanFollowPercent:
                                              double.tryParse(exercisePlanTextController.text) ?? 0,
                                          nCreationDate: timeForSend,
                                          description: descriptionTextController.text);
                                      BlocProvider.of<CreateUserFlowBloc>(
                                              context)
                                          .add(CreateUserFlowLoadingEvent(
                                              userFlowVm: userFlowVm));
                                    }
                                  });
                            },
                          ))
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class ShowImageSelected extends StatefulWidget {
  const ShowImageSelected({Key? key}) : super(key: key);

  @override
  _ShowImageSelectedState createState() => _ShowImageSelectedState();
}

List<FileVm> listImages = [];

class _ShowImageSelectedState extends State<ShowImageSelected> {
  @override
  void initState() {
    listImages = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Container(
      height: sizeScreen.height * 0.23,
      margin: EdgeInsets.only(top: padding, bottom: padding),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          Row(
            children: List.generate(
                listImages.length,
                (index) => Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                          child: AspectRatio(
                            aspectRatio: 1.08,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.memory(
                                listImages[index].pickFiles,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  listImages.removeAt(index);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black87,
                                ),
                                padding: EdgeInsets.all(3),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                  size: 15,
                                ),
                              ),
                            ))
                      ],
                    )),
          ),
          GestureDetector(
            onTap: () async {
              FocusScope.of(context).unfocus();
              bool? selectedImage = await showModalBottomSheet(
                  isDismissible: true,
                  elevation: 20,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => SelectorImageScreen());
              if (selectedImage != null) {
                bool allow;
                // selectedImage=true  get image from camera
                if (selectedImage == true) {
                  allow = await _requestPermission(Permission.camera);
                  if (allow) getImage(ImageSource.camera);
                }

                // selectedImage=false get image from gallery
                else if (selectedImage == false) {
                  allow = await _requestPermission(Permission.storage);
                  if (allow) getImage(ImageSource.gallery);
                }
              }
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: padding / 2),
              child: AspectRatio(
                aspectRatio: 1.08,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: [3],
                    color: Colors.black,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/addImageCoach.svg',
                            width:
                                kFontSizeText(sizeScreen, FontSize.title) + 20,
                            height:
                                kFontSizeText(sizeScreen, FontSize.title) + 20,
                          ),
                          Text(
                            'افزودن تصویر',
                            style: textStyle.copyWith(
                                fontSize:
                                    kFontSizeText(sizeScreen, FontSize.title),
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Future<void> getImage(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: imageSource);
    if (pickedImage != null) {
      var x = await pickedImage.readAsBytes();
      var result = await Navigator.of(context)
          .pushNamed(CropPage.routeName, arguments: x);
      if (result != null) {
        listImages.add(
            FileVm(fileName: pickedImage.path, pickFiles: result as Uint8List));
        setState(() {});
      }
    }
  }
}
