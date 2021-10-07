part of 'create_user_flow_bloc.dart';

@immutable
abstract class CreateUserFlowState {}

class CreateUserFlowInitialState extends CreateUserFlowState {}

class CreateUserFlowLoadingState extends CreateUserFlowState {}

class CreateUserFlowErrorSatte extends CreateUserFlowState {
  final String message;
  CreateUserFlowErrorSatte({required this.message});
}

class CreateUserFlowLoadedState extends CreateUserFlowState {
  final ResultObject? resultObject;
  CreateUserFlowLoadedState({required this.resultObject});
}
