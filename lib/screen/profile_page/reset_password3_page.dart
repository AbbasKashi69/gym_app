import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/profile_page/reset_password2_page.dart';

class ResetPassword3Page extends StatefulWidget {
  const ResetPassword3Page({Key? key}) : super(key: key);

  @override
  _ResetPassword3PageState createState() => _ResetPassword3PageState();
}

class _ResetPassword3PageState extends State<ResetPassword3Page> {
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
                obscureText: false,
                decoration: InputDecoration(
                    suffix: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5),
                        child: GestureDetector(
                          onTap: () {},
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
                obscureText: false,
                decoration: InputDecoration(
                    suffix: Padding(
                        padding: const EdgeInsetsDirectional.only(end: 5),
                        child: GestureDetector(
                          onTap: () {},
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
                height: 40,
              ),
              CustomeButton(
                  sizeScreen: MediaQuery.of(context).size,
                  title: "پایان",
                  onTap: () {
                    showSuccessDialog();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void showSuccessDialog() {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        ),
        builder: (context) => Container(
            height: 250,
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
                  height: 15,
                ),
                SvgPicture.asset('assets/icons/key-icon.svg'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "بازیابی رمز با موفقیت انجام شد(;",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ],
            )));
  }
}
