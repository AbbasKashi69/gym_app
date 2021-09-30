part of 'create_using_form_diet_bloc.dart';

@immutable
abstract class CreateUsingFormDietState {}

class CreateUsingFormDietInitialSate extends CreateUsingFormDietState {}

class CreateUsingFormDietLoadingState extends CreateUsingFormDietState {}

class CreateUsingFormDietErrorSatte extends CreateUsingFormDietState {
  final String message;
  CreateUsingFormDietErrorSatte({required this.message});
}

class CreateUsingFormDietLoadedState extends CreateUsingFormDietState {
  final ResultObject? resultObject;
  CreateUsingFormDietLoadedState({required this.resultObject});
}
