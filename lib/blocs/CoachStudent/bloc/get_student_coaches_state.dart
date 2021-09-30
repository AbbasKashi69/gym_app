part of 'get_student_coaches_bloc.dart';

@immutable
abstract class GetStudentCoachesState {}

class GetStudentCoachesInitialState extends GetStudentCoachesState {}

class GetStudentCoachesLoadingState extends GetStudentCoachesState {}

class GetStudentCoachesErrorSatte extends GetStudentCoachesState {
  final String message;
  GetStudentCoachesErrorSatte({required this.message});
}

class GetStudentCoachesLoadedState extends GetStudentCoachesState {
  final List<CoachStudentVm>? listCoachStudentVm;
  GetStudentCoachesLoadedState({this.listCoachStudentVm});
}
