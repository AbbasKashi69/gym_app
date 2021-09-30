part of 'request_to_coach_bloc.dart';

@immutable
abstract class RequestToCoachEvent {}

class RequestToCoachLoadingEvent extends RequestToCoachEvent {
  final int? coachId;
  RequestToCoachLoadingEvent({this.coachId});
}
