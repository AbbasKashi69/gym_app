import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/ForgetPassProviderVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'send_code_reset_password_event.dart';
part 'send_code_reset_password_state.dart';

class SendCodeResetPasswordBloc
    extends Bloc<SendCodeResetPasswordEvent, SendCodeResetPasswordState> {
  SendCodeResetPasswordBloc() : super(SendCodeResetPasswordInitialState());
  AccountService _accountService = AccountService();
  @override
  Stream<SendCodeResetPasswordState> mapEventToState(
    SendCodeResetPasswordEvent event,
  ) async* {
    if (event is SendCodeResetPasswordLoadingEvent) {
      yield SendCodeResetPasswordLoadingState();
      try {
        var data = await _accountService
            .sendCodeResetPassword(event.forgetPassProviderVm);
        yield SendCodeResetPasswordLoadedState(resultObject: data);
      } catch (e) {
        print('error in send code reset password loaded state ' + e.toString());
        yield SendCodeResetPasswordErrorState(message: e.toString());
      }
    }
  }
}
