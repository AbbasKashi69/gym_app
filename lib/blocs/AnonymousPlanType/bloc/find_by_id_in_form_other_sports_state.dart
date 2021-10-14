part of 'find_by_id_in_form_other_sports_bloc.dart';

@immutable
abstract class FindByIdInFormOtherSportsState {}

class FindByIdInFormOtherSportsInitialState
    extends FindByIdInFormOtherSportsState {}

class FindByIdInFormOtherSportsLoadingState
    extends FindByIdInFormOtherSportsState {}

class FindByIdInFormOtherSportsErrorSatte
    extends FindByIdInFormOtherSportsState {
  final String message;
  FindByIdInFormOtherSportsErrorSatte({required this.message});
}

class FindByIdInFormOtherSportsLoadedState
    extends FindByIdInFormOtherSportsState {
  final ResultObject? resultObject;
  FindByIdInFormOtherSportsLoadedState({required this.resultObject});
}
