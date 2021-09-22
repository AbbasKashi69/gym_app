import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/Account/RoleVm.dart';
import 'package:meta/meta.dart';

part 'get_current_user_role_event.dart';
part 'get_current_user_role_state.dart';

class GetCurrentUserRoleBloc
    extends Bloc<GetCurrentUserRoleEvent, GetCurrentUserRoleState> {
  GetCurrentUserRoleBloc() : super(GetCurrentUserRoleInitialState());
  AccountService _accountService = AccountService();

  @override
  Stream<GetCurrentUserRoleState> mapEventToState(
    GetCurrentUserRoleEvent event,
  ) async* {
    if (event is GetCurrentUserRoleLoadingEvent) {
      yield GetCurrentUserRoleLoadingState();
      try {
        var data = await _accountService.getCurrentUserRole(event.userId);
        yield GetCurrentUserRoleLoadedState(listRoleVm: data);
      } catch (e) {
        print('error in get current user role loaded state' + e.toString());
        yield GetCurrentUserRoleErrorSatte(message: e.toString());
      }
    }
  }
}
