part of 'get_user_flow_by_date_bloc.dart';

@immutable
abstract class GetUserFlowByDateEvent {}

class GetUserFlowByDateLoadingEvent extends GetUserFlowByDateEvent {
  final int? coachId;
  final int? studentId;
  final String date;
  GetUserFlowByDateLoadingEvent(
      {required this.coachId, required this.studentId, required this.date});
}
