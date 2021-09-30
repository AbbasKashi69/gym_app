part of 'get_coach_students_bloc.dart';

@immutable
abstract class GetCoachStudentsEvent {}

class GetCoachStudentsLoadingEvent extends GetCoachStudentsEvent {
  final int? coachId;
  final String? statsuString;
  GetCoachStudentsLoadingEvent({this.coachId, this.statsuString});
}

class GetCoachStudentsLoadedEvent extends GetCoachStudentsEvent {
  final int? coachId;
  final String? statsuString;
  GetCoachStudentsLoadedEvent({this.coachId, this.statsuString});
}
