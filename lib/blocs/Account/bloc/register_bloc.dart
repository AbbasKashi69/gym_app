import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/RegisterVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitialState());
  AccountService _accountService = AccountService();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is RegisterLoadingEvent) {
      yield RegisterLoadingState();
      try {
        var data = await _accountService.register(event.registerVm.mobile!);
        yield RegisterLoadedState(resultObject: data);
      } catch (e) {
        print('error in registerloaded state' + e.toString());
        yield RegisterErrorSatte(message: e.toString());
      }
    }
  }
}
