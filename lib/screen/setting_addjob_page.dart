import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/setting_addjob_final_page.dart';

class SettingAddJobPage extends StatefulWidget {
  const SettingAddJobPage({Key? key}) : super(key: key);

  @override
  _SettingAddJobPageState createState() => _SettingAddJobPageState();
}

class _SettingAddJobPageState extends State<SettingAddJobPage> {

  bool secure = true;

  @override
  Widget build(BuildContext context) {
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
                height: 40,
              ),
              Text("رمز عبور خود را وارد کنید", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
              SizedBox(
                height: 40,
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
                    labelText: 'رمز عبور'),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {},
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
                height: 40,
              ),
              Material(
                borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(20), right: Radius.circular(20)),
                child: Ink(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: [
                            parseColor('#F3F3F3'),
                            parseColor('#F3F3F3'),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingAddJobFinalPage(),
                          ));
                    },
                    splashColor: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20), right: Radius.circular(20)),
                    child: Container(
                      height: Get.height * 0.07,
                      width: Get.width * 0.8,
                      child: Center(
                        child: Text(
                          "ادامه",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'IRANSans',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
