import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/ConfirmCodeVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'verify_code_reset_passwrod_event.dart';
part 'verify_code_reset_passwrod_state.dart';

class VerifyCodeResetPasswordBloc
    extends Bloc<VerifyCodeResetPasswordEvent, VerifyCodeResetPasswordState> {
  VerifyCodeResetPasswordBloc() : super(VerifyCodeResetPasswordInitialState());
  AccountService _accountService = AccountService();

  @override
  Stream<VerifyCodeResetPasswordState> mapEventToState(
    VerifyCodeResetPasswordEvent event,
  ) async* {
    if (event is VerifyCodeResetPasswordLoadingEvent) {
      yield VerifyCodeResetPasswordLoadingState();
      try {
        var data =
            await _accountService.verifyCodeRestPassword(event.confirmCodeVm);
        yield VerifyCodeResetPasswordLoadedState(resultObject: data);
      } catch (e) {
        print('error in verify code reset passwor ' + e.toString());
        yield VerifyCodeResetPasswordErrorState(message: e.toString());
      }
    }
  }
}
