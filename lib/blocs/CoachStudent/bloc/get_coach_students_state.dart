part of 'get_coach_students_bloc.dart';

@immutable
abstract class GetCoachStudentsState {}

class GetCoachStudentsInitial extends GetCoachStudentsState {}

class GetCoachStudentsLoadingState extends GetCoachStudentsState {}

class GetCoachStudentsErrorSatte extends GetCoachStudentsState {
  final String message;
  GetCoachStudentsErrorSatte({required this.message});
}

class GetCoachStudentsLoadedState extends GetCoachStudentsState {
  final Page_CoachStudentVm? page_coachStudentVm;
  GetCoachStudentsLoadedState({required this.page_coachStudentVm});
  GetCoachStudentsLoadedState copyWith(Page_CoachStudentVm? newList) {
    return GetCoachStudentsLoadedState(
        page_coachStudentVm: newList ?? page_coachStudentVm);
  }
}
