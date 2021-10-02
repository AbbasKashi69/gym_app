import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/ForgetPasswordVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'rest_password_event.dart';
part 'rest_password_state.dart';

class RestPasswordBloc extends Bloc<RestPasswordEvent, RestPasswordState> {
  RestPasswordBloc() : super(RestPasswordInitialState());
  AccountService _accountService = AccountService();

  @override
  Stream<RestPasswordState> mapEventToState(
    RestPasswordEvent event,
  ) async* {
    if (event is RestPasswordLoadingEvent) {
      yield RestPasswordLoadingState();
      try {
        var data = await _accountService.restPassword(event.forgetPasswordVm);
        yield RestPasswordLoadedState(resultObject: data);
      } catch (e) {
        print('error in rest password loaded state ' + e.toString());
        yield RestPasswordErrorState(message: e.toString());
      }
    }
  }
}
