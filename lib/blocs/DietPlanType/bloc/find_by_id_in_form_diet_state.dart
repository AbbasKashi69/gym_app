part of 'find_by_id_in_form_diet_bloc.dart';

@immutable
abstract class FindByIdInFormDietState {}

class FindByIdInFormDietInitialState extends FindByIdInFormDietState {}

class FindByIdInFormDietLoadingState extends FindByIdInFormDietState {}

class FindByIdInFormDietErrorSatte extends FindByIdInFormDietState {
  final String message;
  FindByIdInFormDietErrorSatte({required this.message});
}

class FindByIdInFormDietLoadedState extends FindByIdInFormDietState {
  final ResultObject? resultObject;
  FindByIdInFormDietLoadedState({required this.resultObject});
}
