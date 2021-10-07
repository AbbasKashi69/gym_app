part of 'get_user_flow_chart_information_bloc.dart';

@immutable
abstract class GetUserFlowChartInformationEvent {}

class GetUserFlowChartInformationLoadingEvent
    extends GetUserFlowChartInformationEvent {
  final int? coachId;
  final int? studentId;
  GetUserFlowChartInformationLoadingEvent(
      {required this.coachId, required this.studentId});
}
