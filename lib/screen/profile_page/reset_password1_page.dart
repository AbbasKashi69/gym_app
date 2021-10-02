import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gym_app/ViewModels/Account/ForgetPassProviderVm.dart';
import 'package:gym_app/blocs/Account/bloc/select_provider_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/send_code_reset_password_bloc.dart';
import 'package:gym_app/components/constant.dart';
import 'package:gym_app/components/myWaiting.dart';
import 'package:gym_app/extensions/ext.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/Register/register_page.dart';
import 'package:gym_app/screen/profile_page/reset_password2_page.dart';

class ResetPassword1Page extends StatelessWidget {
  ResetPassword1Page({Key? key}) : super(key: key);
  static const String routeName = '/restPassword1Page';
  final TextEditingController _mobileTextEditingController =
      TextEditingController();
  final GlobalKey<FormState> _restPass1Key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'تنظیمات رمز عبور',
      ),
      body: Form(
        key: _restPass1Key,
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
                  textEditingController: _mobileTextEditingController,
                  onSubmitted: (String value) {
                    if (_restPass1Key.currentState!.validate()) {
                      BlocProvider.of<SelectProviderBloc>(context).add(
                          SelectProviderLoadingEvent(
                              userName: _mobileTextEditingController.text));
                    }
                  },
                  hintText: 'شماره موبایل',
                  validator: (String? value) {
                    if (value!.length < 11)
                      return 'تعداد کاراکتر کمتر از 11 است';
                    return null;
                  },
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.send,
                ),
                SizedBox(
                  height: 40,
                ),
                BlocConsumer<SendCodeResetPasswordBloc,
                    SendCodeResetPasswordState>(
                  listener: (context, state) {
                    if (state is SendCodeResetPasswordLoadedState) {
                      if (state.resultObject != null) {
                        if (state.resultObject!.success!) {
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                          Navigator.pushNamed(
                              context, ResetPassword2Page.routeName,
                              arguments: _mobileTextEditingController.text);
                        } else
                          Fluttertoast.showToast(
                              msg: state.resultObject!.message!);
                      }
                    }
                  },
                  builder: (context, state) {
                    if (state is SendCodeResetPasswordLoadingState)
                      return MyWaiting();
                    else
                      return BlocConsumer<SelectProviderBloc,
                          SelectProviderState>(
                        listener: (context, state) {
                          if (state is SelectProviderLoadedState) {
                            if (state.resultObject != null) {
                              if (state.resultObject!.success!)
                                BlocProvider.of<SendCodeResetPasswordBloc>(
                                        context)
                                    .add(SendCodeResetPasswordLoadingEvent(
                                        forgetPassProviderVm:
                                            ForgetPassProviderVm(
                                                provider: 'Phone',
                                                userName:
                                                    _mobileTextEditingController
                                                        .text)));
                            }
                          }
                        },
                        builder: (context, state) {
                          if (state is SelectProviderLoadingState)
                            return MyWaiting();
                          else
                            return CustomeButton(
                                sizeScreen: MediaQuery.of(context).size,
                                title: "دریافت کد",
                                onTap: () {
                                  if (_restPass1Key.currentState!.validate()) {
                                    BlocProvider.of<SelectProviderBloc>(context)
                                        .add(SelectProviderLoadingEvent(
                                            userName:
                                                _mobileTextEditingController
                                                    .text));
                                  }
                                });
                        },
                      );
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
