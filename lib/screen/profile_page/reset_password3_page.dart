import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/Account/ForgetPasswordVm.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/blocs/Account/bloc/rest_password_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/Login/login_page.dart';
import 'package:gym_app/screen/Register/register_page.dart';
import 'package:gym_app/screen/profile_page/reset_password2_page.dart';

class ResetPassword3Page extends StatelessWidget {
  ResetPassword3Page({Key? key, required this.carryTokenAndMobile})
      : super(key: key);
  static const String routeName = '/restPassword3Page';
  final CarryTokenAndMobile carryTokenAndMobile;
  final TextEditingController _passTextEditingContrroller =
      TextEditingController();
  final TextEditingController _confirmPassTextEditingContrroller =
      TextEditingController();
  final GlobalKey<FormState> _changePassKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'تنظیمات رمز عبور',
      ),
      body: Form(
        key: _changePassKey,
        child: Container(
          height: sizeScreen.height,
          padding: EdgeInsets.symmetric(horizontal: sizeScreen.width * 0.05),
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
                CustomeRegisterTextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textEditingController: _passTextEditingContrroller,
                    onSubmitted: (String value) {},
                    hintText: 'رمز عبور جدید',
                    validator: (String? value) {
                      if (value!.length < 4)
                        return 'تعداد کاراکتر کمتر از 4 است';
                      return null;
                    }),
                SizedBox(
                  height: 25,
                ),
                CustomeRegisterTextField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.send,
                    textEditingController: _confirmPassTextEditingContrroller,
                    onSubmitted: (String value) {
                      if (_changePassKey.currentState!.validate()) {
                        BlocProvider.of<RestPasswordBloc>(context).add(
                            RestPasswordLoadingEvent(
                                forgetPasswordVm: ForgetPasswordVm(
                                    password: _passTextEditingContrroller.text,
                                    confirmPassword:
                                        _confirmPassTextEditingContrroller.text,
                                    mobile: carryTokenAndMobile.mobile,
                                    token: carryTokenAndMobile.token)));
                      }
                    },
                    hintText: 'تکرار رمز عبور جدید',
                    validator: (String? value) {
                      if (value!.length < 4)
                        return 'تعداد کاراکتر کمتر از 4 است';
                      return null;
                    }),
                SizedBox(
                  height: 40,
                ),
                BlocConsumer<RestPasswordBloc, RestPasswordState>(
                  listener: (context, state) async {
                    if (state is RestPasswordLoadedState) {
                      if (state.resultObject != null) {
                        if (state.resultObject!.success!) {
                          await showSuccessDialog(context);
                          CurrentUserVm.localSavingService!.logOff();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              LoginPage.routeName, (route) => false);
                        } else
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is RestPasswordLoadingState)
                      return MyWaiting();
                    else
                      return CustomeButton(
                          sizeScreen: MediaQuery.of(context).size,
                          title: "پایان",
                          onTap: () {
                            if (_changePassKey.currentState!.validate()) {
                              BlocProvider.of<RestPasswordBloc>(context).add(
                                  RestPasswordLoadingEvent(
                                      forgetPasswordVm: ForgetPasswordVm(
                                          password:
                                              _passTextEditingContrroller.text,
                                          confirmPassword:
                                              _confirmPassTextEditingContrroller
                                                  .text,
                                          mobile: carryTokenAndMobile.mobile,
                                          token: carryTokenAndMobile.token)));
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

  Future showSuccessDialog(BuildContext context) {
    return showModalBottomSheet(
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
