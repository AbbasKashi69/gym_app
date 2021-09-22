part of 'request_to_coach_bloc.dart';

@immutable
abstract class RequestToCoachState {}

class RequestToCoachInitialState extends RequestToCoachState {}

class RequestToCoachLoadingState extends RequestToCoachState {
  final int? coachId;
  RequestToCoachLoadingState({this.coachId});
}

class RequestToCoachErrorSatte extends RequestToCoachState {
  final String message;
  RequestToCoachErrorSatte({required this.message});
}

class RequestToCoachLoadedState extends RequestToCoachState {
  final ResultObject? resultObject;
  final int? coachId;
  RequestToCoachLoadedState({this.resultObject, required this.coachId});
}
