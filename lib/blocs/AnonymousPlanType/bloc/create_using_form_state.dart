part of 'create_using_form_bloc.dart';

@immutable
abstract class CreateUsingFormOthersSportsState {}

class CreateUsingFormOthersSportsInitialState
    extends CreateUsingFormOthersSportsState {}

class CreateUsingFormOthersSportsLoadingState
    extends CreateUsingFormOthersSportsState {}

class CreateUsingFormOthersSportsErrorSatte
    extends CreateUsingFormOthersSportsState {
  final String message;
  CreateUsingFormOthersSportsErrorSatte({required this.message});
}

class CreateUsingFormOthersSportsLoadedState
    extends CreateUsingFormOthersSportsState {
  final ResultObject? resultObject;
  CreateUsingFormOthersSportsLoadedState({required this.resultObject});
}
