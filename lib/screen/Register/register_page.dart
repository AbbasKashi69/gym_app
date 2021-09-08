import 'dart:async';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:gym_app/screen/Login/login_page.dart';
import 'package:gym_app/screen/Register/password_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final CustomTimerController _controller = new CustomTimerController();
  TextEditingController _editingController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  bool _isFill = false;
  bool _sendCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120), // Set this height
        child: ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: Get.height * 0.25,
            decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                    image: AssetImage("assets/images/appBar.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * 0.05),
              child: Center(
                child: Text(
                  "ثبت نام",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "IRANSans",
                      fontSize: Get.height * 0.03,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics().parent,
        child: Container(
          width: Get.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.15,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: _sendCode
                              ? TextField(
                                  controller: _editingController,
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Get.height * 0.03),
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      labelText: "کد تایید",
                                      alignLabelWithHint: true,
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Get.height * 0.025,
                                          fontFamily: "IRANSans")),
                                )
                              : TextField(
                                  controller: _textEditingController,
                                  onEditingComplete: () {
                                    setState(() {
                                      _isFill = true;
                                      if (_editingController.value.text.isEmpty) {
                                        setState(() {
                                          _isFill = false;
                                        });
                                      }
                                    });
                                  },
                                  onSubmitted: (value) {
                                    setState(() {
                                      _isFill = true;
                                      if (value.isEmpty) {
                                        setState(() {
                                          _isFill = false;
                                        });
                                      }
                                    });
                                  },
                                  keyboardType: TextInputType.phone,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: Get.height * 0.03),
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.call,
                                        color: Colors.grey,
                                      ),
                                      contentPadding: EdgeInsets.all(0),
                                      labelText: "شماره موبایل",
                                      alignLabelWithHint: true,
                                      labelStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: Get.height * 0.025,
                                          fontFamily: "IRANSans")),
                                )),
                      SizedBox(
                        width: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Get.height * 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _isFill
                                ? CustomTimer(
                                    controller: _controller,
                                    from: Duration(minutes: 2),
                                    to: Duration(hours: 0),
                                    interval: Duration(seconds: 1),
                                    builder:
                                        (CustomTimerRemainingTime remaining) {
                                      return Text(
                                        "${remaining.minutes}:${remaining.seconds}",
                                        style: TextStyle(
                                            fontSize: Get.height * 0.025),
                                      );
                                    },
                                  )
                                : Text(
                                    "98+",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: Get.height * 0.025),
                                  ),
                            Container(
                              width: Get.width * 0.15,
                              color: Colors.grey,
                              height: 1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                InkWell(
                  onTap: () {
                    _controller.start();
                    setState(() {
                      _sendCode = true;
                    });
                  },
                  child: _sendCode ? InkWell(
                    onTap: (){
                      Get.to(CreatePasswordPage());
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: Get.height * 0.08,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                              end: Alignment.topCenter,
                              begin: Alignment.topCenter,
                              colors: [
                                Colors.grey.withOpacity(0.3),
                                Colors.grey.withOpacity(0.2),
                              ])),
                      child: Center(
                        child: Text(
                          "ادامه",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: Get.height * 0.025,
                              fontFamily: "IRANSans"),
                        ),
                      ),
                    ),
                  ) : Container(
                    margin: EdgeInsets.only(top: 10),
                    height: Get.height * 0.08,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                            end: Alignment.topCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Colors.grey.withOpacity(0.3),
                              Colors.grey.withOpacity(0.2),
                            ])),
                    child: Center(
                      child: Text(
                        "دریافت کد",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: Get.height * 0.025,
                            fontFamily: "IRANSans"),
                      ),
                    ),
                  )
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(LoginPage());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.2),
                    child: Text(
                      "ورود",
                      style: TextStyle(
                          color: Colors.blue.shade600,
                          fontFamily: "IRANSans",
                          fontSize: Get.height * 0.03),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
