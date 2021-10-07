part of 'chage_status_by_id_bloc.dart';

@immutable
abstract class ChangeStatusByIdState {}

class ChangeStatusByIdInitialState extends ChangeStatusByIdState {}

class ChangeStatusByIdLoadingState extends ChangeStatusByIdState {
  final int? id;
  ChangeStatusByIdLoadingState({this.id});
}

class ChangeStatusByIdErrorSatte extends ChangeStatusByIdState {
  final String message;
  ChangeStatusByIdErrorSatte({required this.message});
}

class ChangeStatusByIdLoadedState extends ChangeStatusByIdState {
  final ResultObject? resultObject;
  ChangeStatusByIdLoadedState({required this.resultObject});
}
