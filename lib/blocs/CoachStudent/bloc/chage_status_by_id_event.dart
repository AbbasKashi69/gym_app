part of 'chage_status_by_id_bloc.dart';

@immutable
abstract class ChangeStatusByIdEvent {}

class ChangeStatusByIdLoadingEvent extends ChangeStatusByIdEvent {
  final int? coachId;
  final int? studentId;
  final bool? isAccepted;
  final int? id;
  ChangeStatusByIdLoadingEvent(
      {required this.coachId,
      required this.studentId,
      required this.isAccepted,
      required this.id});
}
