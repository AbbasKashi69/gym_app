part of 'create_using_form_bloc.dart';

@immutable
abstract class CreateUsingFormState {}

class CreateUsingFormInitialState extends CreateUsingFormState {}

class CreateUsingFormLoadingState extends CreateUsingFormState {}

class CreateUsingFormErrorSatte extends CreateUsingFormState {
  final String message;
  CreateUsingFormErrorSatte({required this.message});
}

class CreateUsingFormLoadedState extends CreateUsingFormState {
  final ResultObject? resultObject;
  CreateUsingFormLoadedState({required this.resultObject});
}
