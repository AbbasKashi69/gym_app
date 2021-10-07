part of 'get_user_flow_chart_information_bloc.dart';

@immutable
abstract class GetUserFlowChartInformationState {}

class GetUserFlowChartInformationInitialState
    extends GetUserFlowChartInformationState {}

class GetUserFlowChartInformationLoadingState
    extends GetUserFlowChartInformationState {}

class GetUserFlowChartInformationErrorSatte
    extends GetUserFlowChartInformationState {
  final String message;
  GetUserFlowChartInformationErrorSatte({required this.message});
}

class GetUserFlowChartInformationLoadedState
    extends GetUserFlowChartInformationState {
  final List<UserFlowChartVm>? listUserFlowChartVm;
  GetUserFlowChartInformationLoadedState({required this.listUserFlowChartVm});
}
