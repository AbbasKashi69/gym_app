part of 'edit_using_form_diet_bloc.dart';

@immutable
abstract class EditUsingFormDietState {}

class EditUsingFormDietInitialState extends EditUsingFormDietState {}

class EditUsingFormDietLoadingState extends EditUsingFormDietState {}

class EditUsingFormDietErrorSatte extends EditUsingFormDietState {
  final String message;
  EditUsingFormDietErrorSatte({required this.message});
}

class EditUsingFormDietLoadedState extends EditUsingFormDietState {
  final ResultObject? resultObject;
  EditUsingFormDietLoadedState({required this.resultObject});
}
