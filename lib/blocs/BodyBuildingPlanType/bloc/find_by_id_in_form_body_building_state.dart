part of 'find_by_id_in_form_body_building_bloc.dart';

@immutable
abstract class FindByIdInFormBodyBuildingState {}

class FindByIdInFormBodyBuildingInitialState
    extends FindByIdInFormBodyBuildingState {}

class FindByIdInFormBodyBuildingLoadingState
    extends FindByIdInFormBodyBuildingState {}

class FindByIdInFormBodyBuildingErrorSatte
    extends FindByIdInFormBodyBuildingState {
  final String message;
  FindByIdInFormBodyBuildingErrorSatte({required this.message});
}

class FindByIdInFormBodyBuildingLoadedState
    extends FindByIdInFormBodyBuildingState {
  final ResultObject? resultObject;
  FindByIdInFormBodyBuildingLoadedState({required this.resultObject});
}
