import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/Services/LocalSavingService.dart';
import 'package:gym_app/ViewModels/Account/LoginVm.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/TokenResponseVm.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState());
  AccountService _accountService = AccountService();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginLoadingEvent) {
      try {
        yield LoginLoadingState();
        var data = await _accountService.login(event.loginVm);
        if (data.success!) {
          var token =
              TokenResponseVm.fromJson(data.extra as Map<String, dynamic>);
          CurrentUserVm.from(token);

          CurrentUserVm.localSavingService!.setUser(CurrentUserVm.toJson());
        }
        yield LoginLoadedState(resultObject: data);
      } catch (e) {
        print('erro in login loaded state ' + e.toString());
        yield LoginErrorSatte(message: e.toString());
      }
    }
  }
}
