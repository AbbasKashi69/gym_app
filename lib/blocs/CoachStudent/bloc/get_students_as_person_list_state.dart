part of 'get_students_as_person_list_bloc.dart';

@immutable
abstract class GetStudentsAsPersonListState {}

class GetStudentsAsPersonListInitialState extends GetStudentsAsPersonListState {
}

class GetStudentsAsPersonListLoadingState extends GetStudentsAsPersonListState {
}

class GetStudentsAsPersonListErrorSatte extends GetStudentsAsPersonListState {
  final String message;
  GetStudentsAsPersonListErrorSatte({required this.message});
}

class GetStudentsAsPersonListLoadedState extends GetStudentsAsPersonListState {
  final List<PersonListVm>? listPersonListVm;
  GetStudentsAsPersonListLoadedState({required this.listPersonListVm});
}
