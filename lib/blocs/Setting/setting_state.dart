part of 'setting_bloc.dart';

@immutable
abstract class CreateBodyBuildingMovementState {}

class CreateBodyBuildingMovementInitialSate extends CreateBodyBuildingMovementState {}

class CreateBodyBuildingMovementLoadingState extends CreateBodyBuildingMovementState {}

class CreateBodyBuildingMovementErrorState extends CreateBodyBuildingMovementState {
  final String message;
  CreateBodyBuildingMovementErrorState({required this.message});
}

class CreateBodyBuildingMovementLoadedState extends CreateBodyBuildingMovementState {
  final ResultObject? resultObject;
  CreateBodyBuildingMovementLoadedState({required this.resultObject});
}
