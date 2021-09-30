part of 'find_person_by_id_bloc.dart';

@immutable
abstract class FindPersonByIdState {}

class FindPersonByIdInitialState extends FindPersonByIdState {}

class FindPersonByIdLoadingState extends FindPersonByIdState {}

class FindPersonByIdErrorSatte extends FindPersonByIdState {
  final String message;
  FindPersonByIdErrorSatte({required this.message});
}

class FindPersonByIdLoadedState extends FindPersonByIdState {
  final PersonVm? personVm;
  FindPersonByIdLoadedState({this.personVm});
}
