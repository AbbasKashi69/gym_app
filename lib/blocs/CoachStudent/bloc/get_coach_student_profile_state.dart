part of 'get_coach_student_profile_bloc.dart';

@immutable
abstract class GetCoachStudentProfileState {}

class GetCoachStudentProfileInitialState extends GetCoachStudentProfileState {}

class GetCoachStudentProfileLoadingState extends GetCoachStudentProfileState {}

class GetCoachStudentProfileErrorSatte extends GetCoachStudentProfileState {
  final String message;
  GetCoachStudentProfileErrorSatte({required this.message});
}

class GetCoachStudentProfileLoadedState extends GetCoachStudentProfileState {
  final ResultObject? resultObject;
  GetCoachStudentProfileLoadedState({required this.resultObject});
}
