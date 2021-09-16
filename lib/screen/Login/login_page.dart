import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/Account/LoginVm.dart';
import 'package:gym_app/blocs/Account/bloc/login_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/Register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const routeName = '/loginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  late TextEditingController _phoneTextInputEditingController;
  late TextEditingController _passTextInputEditingController;
  late bool isVisiblePass;
  @override
  void initState() {
    super.initState();
    _phoneTextInputEditingController = TextEditingController();
    _passTextInputEditingController = TextEditingController();
    isVisiblePass = false;
  }

  @override
  void dispose() {
    _phoneTextInputEditingController.dispose();
    _passTextInputEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return false;
      },
      child: Scaffold(
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
          child: Form(
            key: loginKey,
            child: Container(
              width: Get.width,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: CustomeRegisterTextField(
                                  maxLength: 10,
                                  isHaveIcon: true,
                                  iconPrefix: Icons.call,
                                  textEditingController:
                                      _phoneTextInputEditingController,
                                  validator: (String value) {
                                    if (value.length < 10)
                                      return 'تعداد کاراکتر کمتر از 10 است';
                                    else
                                      return null;
                                  },
                                  onSubmitted: (String value) {},
                                  keyboardType: TextInputType.phone,
                                  textInputAction: TextInputAction.next,
                                  lableText: 'شماره موبایل')),
                          SizedBox(
                            width: 15,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: MediaQuery.of(context).size.width > 550
                                    ? 31
                                    : 26),
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
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                child: CustomeRegisterTextField(
                                    isVisible: isVisiblePass,
                                    changeVisibility: () {
                                      setState(() {
                                        isVisiblePass = !isVisiblePass;
                                      });
                                    },
                                    isObsecure: isVisiblePass,
                                    isHaveIcon: true,
                                    iconPrefix: Icons.vpn_key_outlined,
                                    textEditingController:
                                        _passTextInputEditingController,
                                    validator: (String value) {
                                      if (value.length < 4)
                                        return 'تعداد کاراکتر کمتر از 4 است';
                                      else
                                        return null;
                                    },
                                    onSubmitted: (String value) {
                                      if (loginKey.currentState!.validate()) {
                                        BlocProvider.of<LoginBloc>(context).add(
                                            LoginLoadingEvent(
                                                loginVm: LoginVm(
                                                    userName: '0' +
                                                        _phoneTextInputEditingController
                                                            .text,
                                                    password:
                                                        _passTextInputEditingController
                                                            .text)));
                                      }
                                    },
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.send,
                                    lableText: 'رمز عبور')),
                          ],
                        )),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    BlocConsumer<LoginBloc, LoginState>(
                      listener: (context, state) {
                        if (state is LoginLoadedState) {
                          if (state.resultObject!.success!) {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                MyHomePage.routeName, (route) => false);
                          }
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                        }
                      },
                      builder: (context, state) {
                        if (state is LoginLoadingState)
                          return MyWaiting();
                        else
                          return CustomeButton(
                            sizeScreen: MediaQuery.of(context).size,
                            title: 'ورود',
                            onTap: () {
                              if (loginKey.currentState!.validate()) {
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginLoadingEvent(
                                        loginVm: LoginVm(
                                            userName: '0' +
                                                _phoneTextInputEditingController
                                                    .text,
                                            password:
                                                _passTextInputEditingController
                                                    .text)));
                              }
                            },
                            isReject: true,
                          );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offAndToNamed(RegisterPage.routeName);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: Get.height * 0.1),
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
        ),
      ),
    );
  }
}
