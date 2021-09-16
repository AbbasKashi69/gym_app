import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/ConfirmCodeVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'verify_code_event.dart';
part 'verify_code_state.dart';

class VerifyCodeBloc extends Bloc<VerifyCodeEvent, VerifyCodeState> {
  VerifyCodeBloc() : super(VerifyCodeInitialState());
  AccountService _accountService = AccountService();
  @override
  Stream<VerifyCodeState> mapEventToState(
    VerifyCodeEvent event,
  ) async* {
    if (event is VerifyCodeLoadingEvent) {
      yield VerifyCodeLoadingState();
      try {
        var data = await _accountService.verifyCode(event.confirmCodeVm);
        yield VerifyCodeLoadedState(resultObject: data);
      } catch (e) {
        print('error in verify code bloc ' + e.toString());
        yield VerifyCodeErrorState(message: e.toString());
      }
    }
  }
}
