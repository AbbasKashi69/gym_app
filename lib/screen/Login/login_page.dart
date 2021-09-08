import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:gym_app/screen/Register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _editingController = TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  bool _isFill = false;
  bool _sendCode = false;
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
                  "ورود به حساب کاربری",
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
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _isFill = true;
                            if (value.isEmpty) {
                              setState(() {
                                _isFill = false;
                              });
                            }
                          });
                        },
                        controller: _editingController,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                            color: Colors.black, fontSize: Get.height * 0.03),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(0),
                            labelText: "شماره موبایل",
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            ),
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
                            Text(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
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
                ),
                SizedBox(
                  height: Get.height * 0.025,
                ),
                InkWell(
                    onTap: () {
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
                                _isFill
                                    ? Color.fromRGBO(20, 186, 219, 1)
                                    : Colors.grey.withOpacity(0.3),
                                _isFill
                                    ? Color.fromRGBO(60, 198, 226, 1)
                                    : Colors.grey.withOpacity(0.2)
                              ])),
                      child: Center(
                        child: Text(
                          "ادامه",
                          style: TextStyle(
                              color: _isFill ? Colors.white : Colors.black,
                              fontSize: Get.height * 0.025,
                              fontFamily: "IRANSans"),
                        ),
                      ),
                    )),
                InkWell(
                  onTap: () {
                    Get.to(RegisterPage());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height * 0.15),
                    child: Text(
                      "ثبت نام",
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
