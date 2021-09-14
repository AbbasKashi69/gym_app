import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/SendCodeVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'send_code_event.dart';
part 'send_code_state.dart';

class SendCodeBloc extends Bloc<SendCodeEvent, SendCodeState> {
  SendCodeBloc() : super(SendCodeInitialState());
  AccountService _accountService = AccountService();
  @override
  Stream<SendCodeState> mapEventToState(
    SendCodeEvent event,
  ) async* {
    if (event is SendCodeLoadingEvent) {
      yield SendCodeLoadingState();
      try {
        var data = await _accountService.sendCode(event.sendCodeVm!);
        yield SendCodeLoadedState(resultObject: data);
      } catch (e) {
        print('error in send code bloc ' + e.toString());
        yield SendCodeErrorState(message: e.toString());
      }
    }
  }
}
