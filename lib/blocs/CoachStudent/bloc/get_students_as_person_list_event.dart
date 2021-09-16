part of 'get_students_as_person_list_bloc.dart';

@immutable
abstract class GetStudentsAsPersonListEvent {}

class GetStudentsAsPersonListLoadingEvent extends GetStudentsAsPersonListEvent {
  final int? coachId;
  final String? searchText;
  GetStudentsAsPersonListLoadingEvent({this.coachId, this.searchText});
}
