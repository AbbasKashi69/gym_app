import 'dart:async';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  _CreatePasswordPageState createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  final CustomTimerController _controller = new CustomTimerController();
  TextEditingController _editingController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  bool _isFill = false;
  bool _sendCode = false;
  bool _passwordVisible = false;
  bool _rePasswordVisible = false;

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
                TextField(
                  controller: _editingController,
                  keyboardType: TextInputType.phone,
                  obscureText: !_passwordVisible,
                  style: TextStyle(
                      color: Colors.black, fontSize: Get.height * 0.025),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.lock_outline),
                      contentPadding: EdgeInsets.all(0),
                      labelText: "رمز عبور",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: Get.height * 0.025,
                          fontFamily: "IRANSans")),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  obscureText: !_rePasswordVisible,
                  controller: _textEditingController,
                  keyboardType: TextInputType.phone,

                  style: TextStyle(
                      color: Colors.black, fontSize: Get.height * 0.025),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _rePasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _rePasswordVisible = !_rePasswordVisible;
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.lock_outline),
                      contentPadding: EdgeInsets.all(0),
                      labelText: "تکرار رمز عبور",
                      alignLabelWithHint: true,
                      labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: Get.height * 0.025,
                          fontFamily: "IRANSans")),
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
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height * 0.2),
                  child: Text(
                    "ورود",
                    style: TextStyle(
                        color: Colors.blue.shade600,
                        fontFamily: "IRANSans",
                        fontSize: Get.height * 0.03),
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
