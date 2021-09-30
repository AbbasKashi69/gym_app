part of 'change_status_bloc.dart';

@immutable
abstract class ChangeStatusEvent {}

class ChangeStatusLoadingEvent extends ChangeStatusEvent {
  final int? coachStudentId;
  final bool? isAccepted;
  final int? id;
  ChangeStatusLoadingEvent(
      {required this.coachStudentId,
      required this.isAccepted,
      required this.id});
}
