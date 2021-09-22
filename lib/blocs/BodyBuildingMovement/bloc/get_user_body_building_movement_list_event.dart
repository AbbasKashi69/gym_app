part of 'get_user_body_building_movement_list_bloc.dart';

@immutable
abstract class GetUserBodyBuildingMovementListEvent {}

class GetUserBodyBuildingMovementListLoadingEvent
    extends GetUserBodyBuildingMovementListEvent {
  final String? searchText;
  GetUserBodyBuildingMovementListLoadingEvent({this.searchText = ""});
}
