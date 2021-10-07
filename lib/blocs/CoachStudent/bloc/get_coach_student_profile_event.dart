part of 'get_coach_student_profile_bloc.dart';

@immutable
abstract class GetCoachStudentProfileEvent {}

class GetCoachStudentProfileLoadingEvent extends GetCoachStudentProfileEvent {
  final int? coachId;
  final int? studentId;
  GetCoachStudentProfileLoadingEvent(
      {required this.coachId, required this.studentId});
}
