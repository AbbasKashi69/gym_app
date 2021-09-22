part of 'get_current_user_role_bloc.dart';

@immutable
abstract class GetCurrentUserRoleEvent {}

class GetCurrentUserRoleLoadingEvent extends GetCurrentUserRoleEvent {
  final int? userId;
  GetCurrentUserRoleLoadingEvent({this.userId});
}
