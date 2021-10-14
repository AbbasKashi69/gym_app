part of 'edit_using_form_other_sports_bloc.dart';

@immutable
abstract class EditUsingFormOtherSportsState {}

class EditUsingFormOtherSportsInitialState
    extends EditUsingFormOtherSportsState {}

class EditUsingFormOtherSportsLoadingState
    extends EditUsingFormOtherSportsState {}

class EditUsingFormOtherSportsErrorSatte extends EditUsingFormOtherSportsState {
  final String message;
  EditUsingFormOtherSportsErrorSatte({required this.message});
}

class EditUsingFormOtherSportsLoadedState
    extends EditUsingFormOtherSportsState {
  final ResultObject? resultObject;
  EditUsingFormOtherSportsLoadedState({required this.resultObject});
}
