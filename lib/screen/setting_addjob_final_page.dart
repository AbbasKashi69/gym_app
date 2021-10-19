import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/BodyBuildingMovement/BodyBuildingMovementVm.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/Person/PersonVm.dart';
import 'package:gym_app/blocs/Setting/setting_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/CropPage/crop_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../main.dart';

class SettingAddJobFinalPage extends StatefulWidget {
  const SettingAddJobFinalPage({Key? key}) : super(key: key);
  static const routeName = '/settingAndJobFinalPage';

  @override
  _SettingAddJobFinalPageState createState() => _SettingAddJobFinalPageState();
}

class _SettingAddJobFinalPageState extends State<SettingAddJobFinalPage> {
  PersonVm personVm = PersonVm();
  late bool _isFromNet;
  TextEditingController _controllerFa = TextEditingController();
  TextEditingController _controllerEn = TextEditingController();
  BodyBuildingMovementVm bodyBuildingMovementVm = BodyBuildingMovementVm();
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    final DietPlanTypeFormVm dietPlanTypeFormVm;
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'تنظیمات',
      ),
      body: Container(
        height: gh(1),
        padding: EdgeInsets.symmetric(horizontal: gw(0.05)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                controller: _controllerFa,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "نام حرکت (فارسی)", labelText: 'نام حرکت'),
              ),
              TextField(
                controller: _controllerEn,
                onChanged: (value) {
                  bodyBuildingMovementVm.title = value;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    hintText: "نام حرکت (انگلیسی)", labelText: 'نام حرکت'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("بارگذاری تصویر(png,jpg,gif)"),
                  Material(
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () async {
                        FocusScope.of(context).unfocus();
                        bool? selectedImage =
                            await showProfileMenu(context, sizeScreen);
                        if (selectedImage != null) {
                          bool allow;
                          // selectedImage=true  get image from camera
                          if (selectedImage == true) {
                            allow = await _requestPermission(Permission.camera);
                            if (allow) getImage(ImageSource.camera);
                          }

                          // selectedImage=false get image from gallery
                          else if (selectedImage == false) {
                            allow =
                                await _requestPermission(Permission.storage);
                            if (allow) getImage(ImageSource.gallery);
                          }
                        }
                      },
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 30,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: parseColor('#707070'))),
                        child: Text(
                          "انتخاب فایل",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("پیشنهاد به مدیر"),
                  Switch(
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              BlocConsumer<CreateBodyBuildingMovementBloc,
                  CreateBodyBuildingMovementState>(
                listener: (context, state) async {
                  if (state is CreateBodyBuildingMovementLoadedState) {
                    if (state.resultObject != null &&
                        state.resultObject!.success!) {
                      await Fluttertoast.showToast(
                          msg: state.resultObject!.message!);
                    } else if (state.resultObject != null)
                      Fluttertoast.showToast(msg: state.resultObject!.message!);
                    else
                      Fluttertoast.showToast(msg: 'دوباره امتحان کنید');
                  }
                },
                builder: (context, state) {
                  if (state is CreateBodyBuildingMovementLoadingState)
                    return MyWaiting();
                  else
                    return CustomeButton(
                        sizeScreen: sizeScreen,
                        title: "ثبت",
                        onTap: () {
                          BlocProvider.of<CreateBodyBuildingMovementBloc>(
                                  context)
                              .add(CreateBodyBuildingMovementLoadingEvent(
                                  bodyBuildingMovementVm:
                                      BodyBuildingMovementVm(
                            title: "تست",
                            filePath:
                                bodyBuildingMovementVm.uint8list.toString(),
                          )));
                        });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getImage(ImageSource imageSource) async {
    ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: imageSource);
    if (pickedImage != null) {
      var x = await pickedImage.readAsBytes();
      var result = await Navigator.of(context)
          .pushNamed(CropPage.routeName, arguments: x);
      if (result != null) {
        bodyBuildingMovementVm.fileVm =
            FileVm(fileName: pickedImage.path, pickFiles: result as Uint8List);
        setState(() {
          _isFromNet = false;
          // personVm.picNationCardFile = File(pickNationCard.path);
          bodyBuildingMovementVm.uint8list = result;
        });
      }
    }
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

  Future showProfileMenu(BuildContext context, Size sizeScreen) async {
    return await showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        builder: (context) => Container(
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12))),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                      color: parseColor('#E8E8E8'),
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "تغییر تصویر پروفایل",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: sizeScreen.width * (0.15),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pop(true);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/camera-icon.svg'),
                            SizedBox(
                              height: 10,
                            ),
                            Text("دوربین")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: sizeScreen.width * (0.15),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Navigator.of(context).pop(false);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/gallery-icon.svg',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("گالری")
                          ],
                        ),
                      ),
                      SizedBox(
                        width: sizeScreen.width * (0.15),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
