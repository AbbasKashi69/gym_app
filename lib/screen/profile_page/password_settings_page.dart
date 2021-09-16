import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/profile_page/reset_password1_page.dart';

class PasswordSettingsPage extends StatefulWidget {
  const PasswordSettingsPage({Key? key}) : super(key: key);

  @override
  _PasswordSettingsPageState createState() => _PasswordSettingsPageState();
}

class _PasswordSettingsPageState extends State<PasswordSettingsPage> {
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'تنظیمات رمز عبور',
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
                height: 25,
              ),
              Center(
                  child: SvgPicture.asset(
                      'assets/icons/change-password-icon.svg')),
              SizedBox(
                height: 10,
              ),
              Text("تغییر رمز عبور"),
              SizedBox(
                height: 25,
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: secure,
                decoration: InputDecoration(
                    suffix: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              secure = !secure;
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/icons/hidden-icon.svg',
                            width: 20,
                            height: 20,
                          ),
                        )),
                    alignLabelWithHint: true,
                    labelText: 'رمز عبور فعلی'),
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: secure,
                decoration: InputDecoration(
                    suffix: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              secure = !secure;
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/icons/hidden-icon.svg',
                            width: 20,
                            height: 20,
                          ),
                        )),
                    alignLabelWithHint: true,
                    labelText: 'رمز عبور جدید'),
              ),
              TextField(
                keyboardType: TextInputType.text,
                obscureText: secure,
                decoration: InputDecoration(
                    suffix: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              secure = !secure;
                            });
                          },
                          child: SvgPicture.asset(
                            'assets/icons/hidden-icon.svg',
                            width: 20,
                            height: 20,
                          ),
                        )),
                    alignLabelWithHint: true,
                    labelText: 'تکرار رمز عبور جدید'),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPassword1Page(),
                      ));
                },
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "رمز عبور خود را فراموش کرده اید؟",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: parseColor('#00B4D8')),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              CustomeButton(
                  sizeScreen: MediaQuery.of(context).size,
                  title: "تغییر رمز ",
                  onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
