import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/RegisterVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'submit_register_event.dart';
part 'submit_register_state.dart';

class SubmitRegisterBloc
    extends Bloc<SubmitRegisterEvent, SubmitRegisterState> {
  SubmitRegisterBloc() : super(SubmitRegisterInitialState());
  AccountService _service = AccountService();

  @override
  Stream<SubmitRegisterState> mapEventToState(
    SubmitRegisterEvent event,
  ) async* {
    if (event is SubmitRegisterLoadingEvent) {
      yield SubmitRegisterLoadingState();
      try {
        var data = await _service.submitRegister(event.registerVm);
        // if (data.success) {
        //   var token = data.extra as TokenResponseVm;
        //   CurrentUserVm.from(token);
        //   // CurrentUserVm.from(token);
        //   CurrentUserVm.localSavingService.setUser(CurrentUserVm.toJson());
        // }
        yield SubmitRegisterLoadedState(resultObject: data);
      } catch (e) {
        print('error in submit retgister bloc ' + e.toString());
        yield SubmitRegisterErrorState(message: e.toString());
      }
    }
  }
}
