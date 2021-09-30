import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/Account/SetPasswordVm.dart';
import 'package:gym_app/blocs/Account/bloc/change_password_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/profile_page/reset_password1_page.dart';

class PasswordSettingsPage extends StatefulWidget {
  const PasswordSettingsPage({Key? key}) : super(key: key);
  static const String routeName = '/passwordSettingPage';

  @override
  _PasswordSettingsPageState createState() => _PasswordSettingsPageState();
}

class _PasswordSettingsPageState extends State<PasswordSettingsPage> {
  late TextEditingController _currentPassTextController;
  late TextEditingController _newPassTextController;
  late TextEditingController _confirmPassController;
  final GlobalKey<FormState> _changePassKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _currentPassTextController = TextEditingController();
    _newPassTextController = TextEditingController();
    _confirmPassController = TextEditingController();
  }

  @override
  void dispose() {
    _currentPassTextController.dispose();
    _newPassTextController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  bool secure = true;
  bool secureNewPass = true;
  bool secureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'تنظیمات رمز عبور',
      ),
      body: Form(
        key: _changePassKey,
        child: Container(
          height: gh(1),
          padding: EdgeInsets.symmetric(horizontal: gw(0.05)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12), topLeft: Radius.circular(12))),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                TextFormField(
                  validator: (String? value) {
                    if (value!.length < 4) return 'تعداد کاراکتر کمتر از 4است';
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  controller: _currentPassTextController,
                  keyboardType: TextInputType.text,
                  obscureText: secure,
                  decoration: InputDecoration(
                      suffix: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  secure = !secure;
                                });
                              },
                              child: Icon(
                                secure
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20,
                              ))),
                      alignLabelWithHint: true,
                      labelText: 'رمز عبور فعلی'),
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.length < 4) return 'تعداد کاراکتر کمتر از 4است';
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  controller: _newPassTextController,
                  keyboardType: TextInputType.text,
                  obscureText: secureNewPass,
                  decoration: InputDecoration(
                      suffix: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  secureNewPass = !secureNewPass;
                                });
                              },
                              child: Icon(
                                secureNewPass
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20,
                              ))),
                      alignLabelWithHint: true,
                      labelText: 'رمز عبور جدید'),
                ),
                TextFormField(
                  validator: (String? value) {
                    if (value!.length < 4) return 'تعداد کاراکتر کمتر از 4است';
                    return null;
                  },
                  onFieldSubmitted: (String value) {
                    if (_changePassKey.currentState!.validate()) {
                      SetPasswordVm setPasswordVm = SetPasswordVm(
                          oldPassword: _currentPassTextController.text,
                          newPassword: _newPassTextController.text,
                          confirmPassword: _confirmPassController.text);

                      BlocProvider.of<ChangePasswordBloc>(context).add(
                          ChangePasswordLoadingEvent(
                              setPasswordVm: setPasswordVm));
                    }
                  },
                  textInputAction: TextInputAction.send,
                  controller: _confirmPassController,
                  keyboardType: TextInputType.text,
                  obscureText: secureConfirmPass,
                  decoration: InputDecoration(
                      suffix: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 5),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  secureConfirmPass = !secureConfirmPass;
                                });
                              },
                              child: Icon(
                                secureConfirmPass
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 20,
                              ))),
                      alignLabelWithHint: true,
                      labelText: 'تکرار رمز عبور جدید'),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResetPassword1Page(),
                        ));
                  },
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "رمز عبور خود را فراموش کرده اید؟",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: parseColor('#00B4D8')),
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
                  listener: (context, state) {
                    if (state is ChangePasswordLoadedState) {
                      FocusScope.of(context).unfocus();
                      if (state.resultObject != null) if (state
                          .resultObject!.success!) {
                        _confirmPassController.clear();
                        _newPassTextController.clear();
                        _currentPassTextController.clear();
                      }
                      Fluttertoast.showToast(msg: state.resultObject!.message!);
                    }
                  },
                  builder: (context, state) {
                    if (state is ChangePasswordLoadingState)
                      return MyWaiting();
                    else
                      return CustomeButton(
                          sizeScreen: MediaQuery.of(context).size,
                          title: "تغییر رمز ",
                          onTap: () {
                            if (_changePassKey.currentState!.validate()) {
                              SetPasswordVm setPasswordVm = SetPasswordVm(
                                  oldPassword: _currentPassTextController.text,
                                  newPassword: _newPassTextController.text,
                                  confirmPassword: _confirmPassController.text);

                              BlocProvider.of<ChangePasswordBloc>(context).add(
                                  ChangePasswordLoadingEvent(
                                      setPasswordVm: setPasswordVm));
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
