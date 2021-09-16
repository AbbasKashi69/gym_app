import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/customBottomBar.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/profile_page/password_settings_page.dart';

enum GenderValues { men, women, free }

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GenderValues _selectedGender = GenderValues.free;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: SizedBox(
          width: gw(1),
          child: Column(
            children: [
              SizedBox(
                  height: gh(0.30),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: gh(0.135),
                            width: gw(1),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(25),
                                    bottomLeft: Radius.circular(25))),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: gw(1),
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
                                  width: gw(1),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: gh(0.025), right: gw(0.05)),
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
                                          bottom: gh(0.025), left: gw(0.05)),
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
                              height: gh(0.12),
                              margin: EdgeInsets.only(top: gh(0.1)),
                              padding: EdgeInsets.all(8),
                              width: gw(0.9),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Container(
                                        width: gw(0.17),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                                color: parseColor('#707070'),
                                                width: 1)),
                                        child: Image.asset(
                                            'assets/images/profile_image.png'),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "علی تلخابی",
                                        style: const TextStyle(fontSize: 18),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showProfileMenu();
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
                width: gw(0.9),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "ویرایش اطلاعات کاربری",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "نام",
                        alignLabelWithHint: true,
                        hintText: 'نام خود را وارد کنید',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: "نام خانوادگی",
                        alignLabelWithHint: true,
                        hintText: 'نام خانوادگی خود را وارد کنید',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "ایمیل",
                        alignLabelWithHint: true,
                        hintText: 'آدرس ایمیل بطور کامل و شمال @ باشد',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "کد ملی",
                        alignLabelWithHint: true,
                        hintText: 'کد ملی شامل 10 رقم می باشد',
                      ),
                    ),
                    TextField(
                      controller: TextEditingController()..text = '09302184230',
                      keyboardType: TextInputType.number,
                      readOnly: true,
                      decoration: InputDecoration(
                          suffix: Padding(
                              padding: const EdgeInsetsDirectional.only(end: 5),
                              child: GestureDetector(
                                onTap: () {
                                  // here we should clear textfield  using textEditing controller
                                  //using this code: textEditingController.clear()
                                },
                                child: SvgPicture.asset(
                                  'assets/icons/lock-icon.svg',
                                  width: 20,
                                  height: 20,
                                ),
                              )),
                          alignLabelWithHint: true,
                          labelText: 'شماره موبایل'),
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "شماره تلفن",
                        alignLabelWithHint: true,
                        hintText: 'شماره تلفن ثابت خود را وارد نمایید',
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "آدرس",
                        alignLabelWithHint: true,
                        hintText: 'آدرس محل سکونت خود را وارد نمایید',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswordSettingsPage(),
                            ));
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
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
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
                    CustomeButton(
                        sizeScreen: MediaQuery.of(context).size,
                        title: "ثبت تغییرات",
                        onTap: () {}),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  void showProfileMenu() {
    showModalBottomSheet(
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
                        width: gw(0.15),
                      ),
                      InkWell(
                        onTap: () {},
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
                        width: gw(0.15),
                      ),
                      InkWell(
                        onTap: () {},
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
                        width: gw(0.15),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
