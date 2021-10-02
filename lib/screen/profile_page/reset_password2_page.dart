import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/Account/ConfirmCodeVm.dart';
import 'package:gym_app/blocs/Account/bloc/verify_code_reset_passwrod_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/Register/register_page.dart';
import 'package:gym_app/screen/profile_page/reset_password3_page.dart';

class ResetPassword2Page extends StatefulWidget {
  const ResetPassword2Page({Key? key, required this.userName})
      : super(key: key);
  static const String routeName = '/restPassword2Page';
  final String userName;

  @override
  _ResetPassword2PageState createState() => _ResetPassword2PageState();
}

class _ResetPassword2PageState extends State<ResetPassword2Page> {
  final GlobalKey<FormState> _codeKey = GlobalKey<FormState>();
  late Timer _timer;
  late TextEditingController _sendCodeTextEditingController;
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
    _sendCodeTextEditingController = TextEditingController();
    startTimer();
  }

  @override
  void dispose() {
    _sendCodeTextEditingController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'تنظیمات رمز عبور',
      ),
      body: Form(
        key: _codeKey,
        child: Container(
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
                        child: CustomeRegisterTextField(
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.send,
                            textEditingController:
                                _sendCodeTextEditingController,
                            onSubmitted: (String value) {
                              if (_codeKey.currentState!.validate()) {
                                BlocProvider.of<VerifyCodeResetPasswordBloc>(
                                        context)
                                    .add(VerifyCodeResetPasswordLoadingEvent(
                                        confirmCodeVm: ConfirmCodeVm(
                                            typeSelect: 'Phone',
                                            code: _sendCodeTextEditingController
                                                .text,
                                            userName: widget.userName)));
                              }
                            },
                            hintText: 'کد تایید',
                            validator: (String? value) {
                              if (value!.isEmpty)
                                return 'کد تایید نمیتواند خالی باشد';
                              return null;
                            })),
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
                BlocConsumer<VerifyCodeResetPasswordBloc,
                    VerifyCodeResetPasswordState>(
                  listener: (context, state) {
                    if (state is VerifyCodeResetPasswordLoadedState) {
                      if (state.resultObject != null) {
                        if (state.resultObject!.success!) {
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                          Navigator.of(context).pushNamed(
                              ResetPassword3Page.routeName,
                              arguments: CarryTokenAndMobile(
                                  mobile: widget.userName,
                                  token: state.resultObject!.extra! as String));
                        } else
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is VerifyCodeResetPasswordLoadingState)
                      return MyWaiting();
                    else
                      return CustomeButton(
                          sizeScreen: MediaQuery.of(context).size,
                          title: "ادامه",
                          onTap: () {
                            if (_codeKey.currentState!.validate()) {
                              BlocProvider.of<VerifyCodeResetPasswordBloc>(
                                      context)
                                  .add(VerifyCodeResetPasswordLoadingEvent(
                                      confirmCodeVm: ConfirmCodeVm(
                                          typeSelect: 'Phone',
                                          code: _sendCodeTextEditingController
                                              .text,
                                          userName: widget.userName)));
                            }
                          });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarryTokenAndMobile {
  final String token;
  final String mobile;
  CarryTokenAndMobile({required this.mobile, required this.token});
}
