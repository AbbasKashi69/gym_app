part of 'create_using_form_body_building_bloc.dart';

@immutable
abstract class CreateUsingFormBodyBuildingState {}

class CreateUsingFormBodyBuildingInitialState
    extends CreateUsingFormBodyBuildingState {}

class CreateUsingFormBodyBuildingLoadingState
    extends CreateUsingFormBodyBuildingState {}

class CreateUsingFormBodyBuildingErrorSatte
    extends CreateUsingFormBodyBuildingState {
  final String message;
  CreateUsingFormBodyBuildingErrorSatte({required this.message});
}

class CreateUsingFormBodyBuildingLoadedState
    extends CreateUsingFormBodyBuildingState {
  final ResultObject? resultObject;
  CreateUsingFormBodyBuildingLoadedState({required this.resultObject});
}
