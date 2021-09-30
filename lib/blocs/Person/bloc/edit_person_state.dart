part of 'edit_person_bloc.dart';

@immutable
abstract class EditPersonState {}

class EditPersonInitialState extends EditPersonState {}

class EditPersonLoadingState extends EditPersonState {}

class EditPersonErrorSatte extends EditPersonState {
  final String message;
  EditPersonErrorSatte({required this.message});
}

class EditPersonLoadedState extends EditPersonState {
  final ResultObject? resultObject;
  EditPersonLoadedState({this.resultObject});
}
