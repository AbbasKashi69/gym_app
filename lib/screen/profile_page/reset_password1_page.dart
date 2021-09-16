import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/profile_page/reset_password2_page.dart';

class ResetPassword1Page extends StatefulWidget {
  const ResetPassword1Page({Key? key}) : super(key: key);

  @override
  _ResetPassword1PageState createState() => _ResetPassword1PageState();
}

class _ResetPassword1PageState extends State<ResetPassword1Page> {
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
                keyboardType: TextInputType.phone,
                maxLength: 11,
                decoration: InputDecoration(
                    hintText:
                        "شماره همراه خود جهت بازیابی رمز عبور را وارد نمایید",
                    labelText: 'شماره موبایل'),
              ),
              SizedBox(
                height: 40,
              ),
              CustomeButton(
                  sizeScreen: MediaQuery.of(context).size,
                  title: "دریافت کد",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPassword2Page(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
