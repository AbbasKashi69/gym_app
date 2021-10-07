part of 'get_user_flow_by_date_bloc.dart';

@immutable
abstract class GetUserFlowByDateState {}

class GetUserFlowByDateInitialState extends GetUserFlowByDateState {}

class GetUserFlowByDateLoadingState extends GetUserFlowByDateState {}

class GetUserFlowByDateErrorSatte extends GetUserFlowByDateState {
  final String message;
  GetUserFlowByDateErrorSatte({required this.message});
}

class GetUserFlowByDateLoadedState extends GetUserFlowByDateState {
  final ResultObject? resultObject;
  GetUserFlowByDateLoadedState({required this.resultObject});
}
