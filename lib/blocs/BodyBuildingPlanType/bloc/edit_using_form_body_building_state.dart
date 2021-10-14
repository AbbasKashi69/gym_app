part of 'edit_using_form_body_building_bloc.dart';

@immutable
abstract class EditUsingFormBodyBuildingState {}

class EditUsingFormBodyBuildingInitialState
    extends EditUsingFormBodyBuildingState {}

class EditUsingFormBodyBuildingLoadingState
    extends EditUsingFormBodyBuildingState {}

class EditUsingFormBodyBuildingErrorSatte
    extends EditUsingFormBodyBuildingState {
  final String message;
  EditUsingFormBodyBuildingErrorSatte({required this.message});
}

class EditUsingFormBodyBuildingLoadedState
    extends EditUsingFormBodyBuildingState {
  final ResultObject? resultObject;
  EditUsingFormBodyBuildingLoadedState({required this.resultObject});
}
