import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/Person/PersonVm.dart';
import 'package:gym_app/blocs/Person/bloc/edit_person_bloc.dart';
import 'package:gym_app/blocs/Person/bloc/find_person_by_id_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CropPage/crop_page.dart';
import 'package:gym_app/screen/Register/register_page.dart';
import 'package:gym_app/screen/profile_page/password_settings_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

enum GenderValues { men, women, free }
final Map<GenderValues, int> map = {
  GenderValues.men: 0,
  GenderValues.women: 1,
  GenderValues.free: 2
};

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
            child: SizedBox(
                width: sizeScreen.width,
                child: BlocBuilder<FindPersonByIdBloc, FindPersonByIdState>(
                  builder: (context, state) {
                    return AnimatedSwitcher(
                      duration: Duration(milliseconds: 1000),
                      switchInCurve: Curves.easeInSine,
                      child: state is FindPersonByIdLoadingState
                          ? Container(
                              key: ValueKey(1),
                              height: sizeScreen.height / 2,
                              child: MyWaiting())
                          : state is FindPersonByIdLoadedState &&
                                  state.personVm != null
                              ? ItemLoadedProfile(
                                  personVm: state.personVm!,
                                  key: ValueKey(2),
                                )
                              : Container(
                                  key: ValueKey(3),
                                ),
                    );
                  },
                ))),
      ),
    );
  }
}

class ItemLoadedProfile extends StatefulWidget {
  ItemLoadedProfile({Key? key, required this.personVm}) : super(key: key);
  final PersonVm personVm;

  @override
  _ItemLoadedProfileState createState() => _ItemLoadedProfileState();
}

class _ItemLoadedProfileState extends State<ItemLoadedProfile> {
  late GenderValues _selectedGender;
  late bool _isFromNet;

  late TextEditingController _firstNameTextEditingController;
  late TextEditingController _lastNameTextEditingController;

  late TextEditingController _emailTextEditingController;

  late TextEditingController _codeMelliTextEditingController;

  late TextEditingController _phoneTextEditingController;

  late TextEditingController _adressTextEditingController;
  @override
  void initState() {
    _firstNameTextEditingController =
        TextEditingController(text: widget.personVm.firstName ?? "");
    _lastNameTextEditingController =
        TextEditingController(text: widget.personVm.lastName ?? "");
    _emailTextEditingController =
        TextEditingController(text: widget.personVm.email ?? "");
    _codeMelliTextEditingController =
        TextEditingController(text: widget.personVm.nationalCode ?? "");
    _phoneTextEditingController =
        TextEditingController(text: widget.personVm.telphone ?? "");
    _adressTextEditingController = TextEditingController();
    _selectedGender = map.keys
        .where((element) => map[element] == widget.personVm.genderType)
        .toList()
        .first;
    _isFromNet = true;
    super.initState();
  }

  @override
  void dispose() {
    _firstNameTextEditingController.dispose();
    _lastNameTextEditingController.dispose();
    _emailTextEditingController.dispose();
    _codeMelliTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    _adressTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
            height: sizeScreen.height * 0.30,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: sizeScreen.height * 0.135,
                      width: sizeScreen.width * (1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25))),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: sizeScreen.width * (1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                              child: Image.asset(
                                "assets/images/appBar.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            width: sizeScreen.width * (1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(25),
                                  bottomRight: Radius.circular(25)),
                              child: Image.asset(
                                "assets/images/background.png",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: sizeScreen.height * 0.025,
                                    right: sizeScreen.width * (0.05)),
                                child: Text(
                                  "LOGO",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: sizeScreen.height * 0.025,
                                    left: sizeScreen.width * (0.05)),
                                child: SvgPicture.asset(
                                    "assets/icons/notification.svg",
                                    height: 30,
                                    width: 30,
                                    color: Colors.white.withOpacity(0.7)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        height: sizeScreen.height * 0.12,
                        margin: EdgeInsets.only(top: sizeScreen.height * 0.1),
                        padding: EdgeInsets.all(8),
                        width: sizeScreen.width * (0.9),
                        decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 3),
                                  blurRadius: 21)
                            ],
                            borderRadius: BorderRadius.circular(43)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: [
                                  Container(
                                      // width: sizeScreen.width * (0.17),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: parseColor('#707070'),
                                              width: 1)),
                                      child: _isFromNet
                                          ? CircleAvatar(
                                              radius: sizeScreen.width > 550
                                                  ? 35
                                                  : 25,
                                              backgroundImage: NetworkImage(
                                                  widget.personVm.pic ?? ""))
                                          : CircleAvatar(
                                              radius: sizeScreen.width > 550
                                                  ? 35
                                                  : 25,
                                              backgroundImage: MemoryImage(
                                                  widget.personVm.uint8list!))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                      child: Text(
                                    '${widget.personVm.firstName} ${widget.personVm.lastName}',
                                    style: const TextStyle(fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ))
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                bool? selectedImage =
                                    await showProfileMenu(context, sizeScreen);
                                if (selectedImage != null) {
                                  bool allow;
                                  // selectedImage=true  get image from camera
                                  if (selectedImage == true) {
                                    allow = await _requestPermission(
                                        Permission.camera);
                                    if (allow) getImage(ImageSource.camera);
                                  }

                                  // selectedImage=false get image from gallery
                                  else if (selectedImage == false) {
                                    allow = await _requestPermission(
                                        Permission.storage);
                                    if (allow) getImage(ImageSource.gallery);
                                  }
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: SvgPicture.asset(
                                    'assets/icons/select-icon.svg'),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            )),
        SizedBox(
          width: sizeScreen.width * (0.9),
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "ویرایش اطلاعات کاربری",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 20,
              ),
              CustomeRegisterTextField(
                  textEditingController: _firstNameTextEditingController,
                  onSubmitted: (String value) {},
                  hintText: 'نام خود را وارد کنید',
                  lableText: "نام",
                  validator: (String? value) {}),
              SizedBox(height: padding),
              CustomeRegisterTextField(
                  textEditingController: _lastNameTextEditingController,
                  onSubmitted: (String value) {},
                  hintText: 'نام خانوادگی خود را وارد کنید',
                  lableText: "نام خانوادگی",
                  validator: (String? value) {}),
              SizedBox(height: padding),
              CustomeRegisterTextField(
                  keyboardType: TextInputType.emailAddress,
                  textEditingController: _emailTextEditingController,
                  onSubmitted: (String value) {},
                  lableText: "ایمیل",
                  hintText: 'آدرس ایمیل بطور کامل و شمال @ باشد',
                  validator: (String? value) {}),
              SizedBox(height: padding),
              CustomeRegisterTextField(
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  textEditingController: _codeMelliTextEditingController,
                  onSubmitted: (String value) {},
                  hintText: 'کد ملی شامل 10 رقم می باشد',
                  lableText: "کد ملی ",
                  validator: (String? value) {}),
              SizedBox(height: padding),
              TextField(
                controller: _phoneTextEditingController..text = '09370137907',
                keyboardType: TextInputType.number,
                readOnly: true,
                decoration: InputDecoration(
                    suffix: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5),
                        child: GestureDetector(
                          onTap: () {},
                          child: SvgPicture.asset(
                            'assets/icons/lock-icon.svg',
                            width: 20,
                            height: 20,
                          ),
                        )),
                    alignLabelWithHint: true,
                    labelText: 'شماره موبایل'),
              ),
              SizedBox(height: padding),
              CustomeRegisterTextField(
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.done,
                  textEditingController: _adressTextEditingController,
                  onSubmitted: (String value) {},
                  hintText: 'آدرس محل سکونت خود را وارد نمایید',
                  lableText: "آدرس",
                  validator: (String? value) {}),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PasswordSettingsPage.routeName);
                },
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "تنظیمات رمز عبور",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: parseColor('#00B4D8')),
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: parseColor('#00B4D8'),
                height: 5,
              ),
              SizedBox(
                height: 25,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "جنسیت",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: GenderValues.men,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value as GenderValues;
                      });
                    },
                  ),
                  Text("مرد")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: GenderValues.women,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value as GenderValues;
                      });
                    },
                  ),
                  Text("زن")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    value: GenderValues.free,
                    groupValue: _selectedGender,
                    onChanged: (value) {
                      setState(() {
                        _selectedGender = value as GenderValues;
                      });
                    },
                  ),
                  Text("نامشخص")
                ],
              ),
              SizedBox(
                height: 30,
              ),
              BlocConsumer<EditPersonBloc, EditPersonState>(
                listener: (context, state) {
                  if (state is EditPersonLoadedState) {
                    if (state.resultObject != null) {
                      Fluttertoast.showToast(msg: state.resultObject!.message!);
                    }
                  }
                },
                builder: (context, state) {
                  if (state is EditPersonLoadingState)
                    return MyWaiting();
                  else
                    return CustomeButton(
                        sizeScreen: MediaQuery.of(context).size,
                        title: "ثبت تغییرات",
                        onTap: () {
                          widget.personVm.firstName =
                              _firstNameTextEditingController.text;
                          widget.personVm.lastName =
                              _lastNameTextEditingController.text;
                          widget.personVm.nationalCode =
                              _codeMelliTextEditingController.text;
                          widget.personVm.telphone =
                              _phoneTextEditingController.text;
                          widget.personVm.email =
                              _emailTextEditingController.text;
                          widget.personVm.genderType = map[_selectedGender];
                          // persnVm is not have property as name adress
                          // personVm.adress=_adressTextEditingController.text

                          BlocProvider.of<EditPersonBloc>(context).add(
                              EditPersonLoadingEvent(
                                  personVm: widget.personVm));
                        });
                },
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        )
      ],
    );
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
        widget.personVm.fileVm =
            FileVm(fileName: pickedImage.path, pickFiles: result as Uint8List);
        setState(() {
          _isFromNet = false;
          // personVm.picNationCardFile = File(pickNationCard.path);
          widget.personVm.uint8list = result;
        });
      }
    }
  }
}
