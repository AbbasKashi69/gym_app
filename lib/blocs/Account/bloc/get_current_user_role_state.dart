part of 'get_current_user_role_bloc.dart';

@immutable
abstract class GetCurrentUserRoleState {}

class GetCurrentUserRoleInitialState extends GetCurrentUserRoleState {}

class GetCurrentUserRoleLoadingState extends GetCurrentUserRoleState {}

class GetCurrentUserRoleErrorSatte extends GetCurrentUserRoleState {
  final String message;
  GetCurrentUserRoleErrorSatte({required this.message});
}

class GetCurrentUserRoleLoadedState extends GetCurrentUserRoleState {
  final List<RoleVm>? listRoleVm;
  GetCurrentUserRoleLoadedState({required this.listRoleVm});
}
