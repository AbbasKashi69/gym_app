import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/SetPasswordVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc() : super(ChangePasswordInitialState());
  AccountService _accountService = AccountService();

  @override
  Stream<ChangePasswordState> mapEventToState(
      ChangePasswordEvent event) async* {
    if (event is ChangePasswordLoadingEvent) {
      yield ChangePasswordLoadingState();
      try {
        var data = await _accountService.changePassword(event.setPasswordVm);
        yield ChangePasswordLoadedState(resultObject: data);
      } catch (e) {
        print('error in get change password loaded state' + e.toString());
        yield ChangePasswordErrorSatte(message: e.toString());
      }
    }
  }
}
