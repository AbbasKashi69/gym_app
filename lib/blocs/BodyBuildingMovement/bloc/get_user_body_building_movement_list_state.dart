part of 'get_user_body_building_movement_list_bloc.dart';

@immutable
abstract class GetUserBodyBuildingMovementListState {}

class GetUserBodyBuildingMovementListInitialState
    extends GetUserBodyBuildingMovementListState {}

class GetUserBodyBuildingMovementListLoadingState
    extends GetUserBodyBuildingMovementListState {}

class GetUserBodyBuildingMovementListErrorSatte
    extends GetUserBodyBuildingMovementListState {
  final String message;
  GetUserBodyBuildingMovementListErrorSatte({required this.message});
}

class GetUserBodyBuildingMovementListLoadedState
    extends GetUserBodyBuildingMovementListState {
  final List<BodyBuildingMovementVm>? listBodyBuildingMovement;
  GetUserBodyBuildingMovementListLoadedState({this.listBodyBuildingMovement});
}
