part of 'get_resume_bloc.dart';

@immutable
abstract class GetResumeEvent {}

class GetResumeLoadingEvent extends GetResumeEvent {
  final int? coachId;
  GetResumeLoadingEvent({this.coachId});
}
