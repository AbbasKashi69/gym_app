import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gym_app/ViewModels/Account/ConfirmCodeVm.dart';
import 'package:gym_app/ViewModels/Account/RegisterVm.dart';
import 'package:gym_app/ViewModels/Account/SendCodeVm.dart';
import 'package:gym_app/blocs/Account/bloc/register_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/send_code_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/submit_register_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/verify_code_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/Login/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  static const routeName = '/register';

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _codeInputTextEditingController;
  late TextEditingController _phoneTextEditingController;
  late TextEditingController _passTextEditingController;
  late TextEditingController _confirmPassTextEditingController;
  late CustomTimerController _timerController;
  late int _setWidgetTask;
  final GlobalKey<FormState> inputPhoneKey = GlobalKey<FormState>();
  final GlobalKey<FormState> inputCodeKey = GlobalKey<FormState>();
  final GlobalKey<FormState> inputPassKey = GlobalKey<FormState>();
  String? userId;
  @override
  void initState() {
    _setWidgetTask = 1;
    _codeInputTextEditingController = TextEditingController();
    _phoneTextEditingController = TextEditingController();
    _passTextEditingController = TextEditingController();
    _confirmPassTextEditingController = TextEditingController();
    _timerController = CustomTimerController();
    super.initState();
  }

  @override
  void dispose() {
    _codeInputTextEditingController.dispose();
    _phoneTextEditingController.dispose();
    _passTextEditingController.dispose();
    _confirmPassTextEditingController.dispose();
    _timerController.dispose();

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
                    height: Get.height * 0.1,
                  ),
                  //**************************** */
                  _setWidgetTask == 1
                      ? InputPhoneNumberTask(
                          phoneTextInputEditingController:
                              _phoneTextEditingController,
                          funcNextTask: (String id) {
                            setState(() {
                              _setWidgetTask = _setWidgetTask + 1;
                              userId = id;
                            });
                          },
                          inputPhoneKey: inputPhoneKey,
                        )
                      : _setWidgetTask == 2
                          ? InputCodeTask(
                              timerController: _timerController,
                              codeInputTextEditingController:
                                  _codeInputTextEditingController,
                              funcNextTask: () {
                                setState(() {
                                  _setWidgetTask = _setWidgetTask + 1;
                                });
                              },
                              userId: userId ?? "",
                              inputCodeKey: inputCodeKey)
                          : InputPasswordTask(
                              mobileTextInputEditingController:
                                  _phoneTextEditingController,
                              passwordTextInputEditingController:
                                  _passTextEditingController,
                              confirmPassTextInputEditingController:
                                  _confirmPassTextEditingController,
                              inputPassKey: inputPassKey,
                            ),
                  //********************************** */
                  GestureDetector(
                    onTap: () {
                      Get.offAndToNamed(LoginPage.routeName);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
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
      ),
    );
  }
}

// ignore: must_be_immutable
class InputPhoneNumberTask extends StatelessWidget {
  InputPhoneNumberTask(
      {Key? key,
      required this.phoneTextInputEditingController,
      required this.inputPhoneKey,
      required this.funcNextTask})
      : super(key: key);
  final TextEditingController phoneTextInputEditingController;
  final Function funcNextTask;
  final GlobalKey<FormState> inputPhoneKey;
  String userId = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: inputPhoneKey,
          child: Padding(
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
                        textEditingController: phoneTextInputEditingController,
                        validator: (String value) {
                          if (value.length < 10)
                            return 'تعداد کاراکتر کمتر از 10 است';
                          else
                            return null;
                        },
                        onSubmitted: (String value) {
                          if (inputPhoneKey.currentState!.validate()) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            BlocProvider.of<RegisterBloc>(context).add(
                                RegisterLoadingEvent(
                                    registerVm: RegisterVm(
                                        mobile: phoneTextInputEditingController
                                            .text)));
                          }
                        },
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.send,
                        lableText: 'شماره موبایل')),
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom:
                          MediaQuery.of(context).size.width > 550 ? 31 : 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "98+",
                        style: TextStyle(
                            color: Colors.black, fontSize: Get.height * 0.025),
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
        ),
        SizedBox(
          height: Get.height * 0.1,
        ),
        BlocConsumer<SendCodeBloc, SendCodeState>(
          listener: (context, state) {
            if (state is SendCodeLoadedState) {
              if (state.resultObject != null && state.resultObject!.success!) {
                funcNextTask(userId);
              } else if (state.resultObject != null) {
                Fluttertoast.showToast(msg: state.resultObject!.message ?? "");
              } else
                Fluttertoast.showToast(
                  msg: 'دوباره امتحان کنید',
                );
            }
          },
          builder: (context, state) {
            if (state is SendCodeLoadingState)
              return MyWaiting();
            else
              return BlocConsumer<RegisterBloc, RegisterState>(
                listener: (context, state) {
                  if (state is RegisterLoadedState) {
                    if (state.resultObject != null &&
                        state.resultObject!.success!) {
                      userId = state.resultObject!.id.toString();
                      BlocProvider.of<SendCodeBloc>(context).add(
                          SendCodeLoadingEvent(
                              sendCodeVm: SendCodeVm(
                                  selectedProvider: 'Phone',
                                  userId: state.resultObject!.id.toString())));
                    } else if (state.resultObject != null) {
                      Fluttertoast.showToast(
                          msg: state.resultObject!.message ?? "");
                    } else
                      Fluttertoast.showToast(
                        msg: 'دوباره امتحان کنید',
                      );
                  }
                },
                builder: (context, state) {
                  if (state is RegisterLoadingState)
                    return MyWaiting();
                  else
                    return CustomeButton(
                      sizeScreen: MediaQuery.of(context).size,
                      title: 'دریافت کد',
                      onTap: () {
                        if (inputPhoneKey.currentState!.validate()) {
                          BlocProvider.of<RegisterBloc>(context).add(
                              RegisterLoadingEvent(
                                  registerVm: RegisterVm(
                                      mobile: '0' +
                                          phoneTextInputEditingController
                                              .text)
                              ));
                        }
                      },
                      isReject: true,
                    );
                },
              );
          },
        )
      ],
    );
  }
}

class InputCodeTask extends StatelessWidget {
  InputCodeTask(
      {Key? key,
      required this.codeInputTextEditingController,
      required this.funcNextTask,
      required this.userId,
      required this.timerController,
      required this.inputCodeKey})
      : super(key: key);
  final TextEditingController codeInputTextEditingController;
  final Function funcNextTask;
  final GlobalKey<FormState> inputCodeKey;
  final CustomTimerController timerController;
  final String userId;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Column(
      children: [
        Form(
          key: inputCodeKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: CustomeRegisterTextField(
                        isHaveIcon: false,
                        textEditingController: codeInputTextEditingController,
                        validator: (String value) {
                          if (value.isEmpty)
                            return 'کد تایید نمیتواند خالی باشد';
                          else
                            return null;
                        },
                        onSubmitted: (String value) {
                          if (inputCodeKey.currentState!.validate()) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            BlocProvider.of<VerifyCodeBloc>(context).add(
                                VerifyCodeLoadingEvent(
                                    confirmCodeVm: ConfirmCodeVm(
                                        typeSelect: 'Phone',
                                        userId: userId,
                                        code: codeInputTextEditingController
                                            .text)));
                          }
                        },
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.send,
                        lableText: 'کد تایید')),
                SizedBox(
                  width: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(top: Get.height * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTimer(
                        controller: timerController,
                        from: Duration(minutes: 2),
                        to: Duration(minutes: 0),
                        interval: Duration(seconds: 1),
                        onBuildAction: CustomTimerAction.auto_start,
                        builder: (CustomTimerRemainingTime remaining) {
                          return Text(
                            "${remaining.minutes}:${remaining.seconds}",
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle)),
                          );
                        },
                        finishedBuilder: (CustomTimerRemainingTime remaining) {
                          return Text(
                            "${remaining.minutes}:${remaining.seconds}",
                            style: textStyle.copyWith(
                                fontSize: kFontSizeText(
                                    sizeScreen, FontSize.subTitle)),
                          );
                        },
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
        ),
        SizedBox(
          height: Get.height * 0.04,
        ),
        BlocConsumer<VerifyCodeBloc, VerifyCodeState>(
          listener: (context, state) {
            if (state is VerifyCodeLoadedState) {
              if (state.resultObject != null && state.resultObject!.success!) {
                funcNextTask();
              } else if (state.resultObject != null) {
                Fluttertoast.showToast(msg: state.resultObject!.message ?? "");
              } else
                Fluttertoast.showToast(msg: 'دوباره امتحان کنید');
            }
          },
          builder: (context, state) {
            if (state is VerifyCodeLoadingState)
              return MyWaiting();
            else
              return CustomeButton(
                sizeScreen: MediaQuery.of(context).size,
                title: 'ادامه',
                onTap: () {
                  if (inputCodeKey.currentState!.validate()) {
                    BlocProvider.of<VerifyCodeBloc>(context).add(
                        VerifyCodeLoadingEvent(
                            confirmCodeVm: ConfirmCodeVm(
                                typeSelect: 'Phone',
                                userId: userId,
                                code: codeInputTextEditingController.text)));
                  }
                },
                isReject: true,
              );
          },
        )
      ],
    );
  }
}

class InputPasswordTask extends StatefulWidget {
  const InputPasswordTask(
      {Key? key,
      required this.inputPassKey,
      required this.mobileTextInputEditingController,
      required this.confirmPassTextInputEditingController,
      required this.passwordTextInputEditingController})
      : super(key: key);
  final TextEditingController passwordTextInputEditingController;
  final TextEditingController confirmPassTextInputEditingController;
  final TextEditingController mobileTextInputEditingController;
  final GlobalKey<FormState> inputPassKey;

  @override
  _InputPasswordTaskState createState() => _InputPasswordTaskState();
}

class _InputPasswordTaskState extends State<InputPasswordTask> {
  bool isVisiblePass = true;
  bool isVisibleConfirmPass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.inputPassKey,
      child: Column(
        children: [
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
                              widget.passwordTextInputEditingController,
                          validator: (String value) {
                            if (value.length < 4)
                              return 'تعداد کاراکتر کمتر از 4 است';
                            else
                              return null;
                          },
                          onSubmitted: (String value) {},
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          lableText: 'رمز عبور')),
                ],
              )),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: CustomeRegisterTextField(
                          isVisible: isVisibleConfirmPass,
                          changeVisibility: () {
                            setState(() {
                              isVisibleConfirmPass = !isVisibleConfirmPass;
                            });
                          },
                          isObsecure: isVisibleConfirmPass,
                          isHaveIcon: true,
                          iconPrefix: Icons.vpn_key_outlined,
                          textEditingController:
                              widget.confirmPassTextInputEditingController,
                          validator: (String value) {
                            if (value.length < 4)
                              return 'تعداد کاراکتر کمتر از 4 است';
                            else
                              return null;
                          },
                          onSubmitted: (String value) {
                            if (widget.inputPassKey.currentState!.validate()) {
                              FocusScope.of(context).requestFocus(FocusNode());
                              BlocProvider.of<SubmitRegisterBloc>(context).add(
                                  SubmitRegisterLoadingEvent(
                                      registerVm: RegisterVm(
                                          password: widget
                                              .passwordTextInputEditingController
                                              .text,
                                          confirmPassword: widget
                                              .confirmPassTextInputEditingController
                                              .text,
                                          mobile: widget
                                              .mobileTextInputEditingController
                                              .text,
                                          username: widget
                                              .mobileTextInputEditingController
                                              .text)));
                            }
                          },
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.send,
                          lableText: 'تایید رمز عبور')),
                ],
              )),
          SizedBox(
            height: Get.height * 0.04,
          ),
          BlocConsumer<SubmitRegisterBloc, SubmitRegisterState>(
            listener: (context, state) {
              if (state is SubmitRegisterLoadedState) {
                if (state.resultObject != null &&
                    state.resultObject!.success!) {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginPage.routeName);
                } else if (state.resultObject != null)
                  Fluttertoast.showToast(msg: state.resultObject!.message!);
                else
                  Fluttertoast.showToast(msg: 'دوباره امتحان کنید');
              }
            },
            builder: (context, state) {
              if (state is SubmitRegisterLoadingState)
                return MyWaiting();
              else
                return CustomeButton(
                  sizeScreen: MediaQuery.of(context).size,
                  title: 'ادامه',
                  onTap: () {
                    if (widget.inputPassKey.currentState!.validate()) {
                      BlocProvider.of<SubmitRegisterBloc>(context).add(
                          SubmitRegisterLoadingEvent(
                              registerVm: RegisterVm(
                                  password: widget
                                      .passwordTextInputEditingController.text,
                                  confirmPassword: widget
                                      .confirmPassTextInputEditingController
                                      .text,
                                  mobile: widget
                                      .mobileTextInputEditingController.text,
                                  username: widget
                                      .mobileTextInputEditingController.text)));
                    }
                  },
                  isReject: true,
                );
            },
          )
        ],
      ),
    );
  }
}

class CustomeRegisterTextField extends StatelessWidget {
  const CustomeRegisterTextField(
      {Key? key,
      required this.textEditingController,
      required this.onSubmitted,
      required this.lableText,
      required this.validator,
      this.changeVisibility,
      this.isObsecure = false,
      this.isVisible = false,
      this.maxLength,
      this.iconPrefix,
      this.isHaveIcon = false,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.name})
      : super(key: key);
  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final Function onSubmitted;
  final TextInputAction textInputAction;
  final Function validator;
  final String lableText;
  final bool isHaveIcon;
  final IconData? iconPrefix;
  final int? maxLength;
  final bool isObsecure;
  final Function? changeVisibility;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return TextFormField(
        controller: textEditingController,
        keyboardType: keyboardType,
        onFieldSubmitted: (String value) {
          return onSubmitted(value);
        },
        textInputAction: textInputAction,
        style: textStyle.copyWith(
            fontSize: kFontSizeText(sizeScreen, FontSize.subTitle)),
        validator: (String? value) {
          return validator(value);
        },
        obscureText: isObsecure,
        maxLength: maxLength,
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        decoration: kInputDecorationRegister.copyWith(
            counterStyle: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle),
                color: Colors.black54),
            contentPadding: EdgeInsets.only(top: 5, bottom: 7),
            suffixIcon: changeVisibility != null
                ? InkWell(
                    onTap: () {
                      changeVisibility!();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: padding, top: 5),
                      child: Icon(
                        isVisible
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            prefix: isHaveIcon
                ? Padding(
                    padding: EdgeInsets.only(left: padding, top: 5),
                    child: Icon(
                      iconPrefix,
                      color: Colors.grey,
                      size: 20,
                    ),
                  )
                : SizedBox.shrink(),
            labelText: lableText,
            hintText: lableText,
            hintStyle: textStyle.copyWith(
                fontSize: kFontSizeText(sizeScreen, FontSize.subTitle))));
  }
}






/*

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
                                      if (_editingController
                                          .value.text.isEmpty) {
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
                    child: _sendCode
                        ? InkWell(
                            onTap: () {
                              Get.to(CreatePasswordPage());
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: padding),
                              child: CustomeButton(
                                sizeScreen: sizeScreen,
                                title: 'ادامه',
                                onTap: () {},
                                isReject: true,
                              ),
                            ))
                        : Container(
                            padding: EdgeInsets.only(top: padding),
                            child: CustomeButton(
                              sizeScreen: MediaQuery.of(context).size,
                              title: 'دریافت کد',
                              onTap: () {},
                              isReject: true,
                            ),
                          )),
*/