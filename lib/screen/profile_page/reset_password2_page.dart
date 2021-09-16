import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/profile_page/reset_password3_page.dart';

class ResetPassword2Page extends StatefulWidget {
  const ResetPassword2Page({Key? key}) : super(key: key);

  @override
  _ResetPassword2PageState createState() => _ResetPassword2PageState();
}

class _ResetPassword2PageState extends State<ResetPassword2Page> {
  late Timer _timer;
  int _start = 120;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      maxLength: 5,
                      decoration: InputDecoration(
                          hintText: "کد تایید", labelText: 'کد تایید'),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 50,
                    height: 37,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("$_start"),
                        Divider(
                          height: 2,
                          color: CupertinoColors.black,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomeButton(
                  sizeScreen: MediaQuery.of(context).size,
                  title: "ادامه",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPassword3Page(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
