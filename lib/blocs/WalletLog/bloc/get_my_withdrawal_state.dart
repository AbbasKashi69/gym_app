part of 'get_my_withdrawal_bloc.dart';

@immutable
abstract class GetMyWithdrawalState {}

class GetMyWithdrawalInitialState extends GetMyWithdrawalState {}

class GetMyWithdrawalLoadingState extends GetMyWithdrawalState {}

class GetMyWithdrawalErrorSatte extends GetMyWithdrawalState {
  final String message;
  GetMyWithdrawalErrorSatte({required this.message});
}

class GetMyWithdrawalLoadedState extends GetMyWithdrawalState {
  final TransactionAmountVm? transactionAmountVm;
  GetMyWithdrawalLoadedState({required this.transactionAmountVm});
}
