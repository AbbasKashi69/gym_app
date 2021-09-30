part of 'get_my_deposit_bloc.dart';

@immutable
abstract class GetMyDepositState {}

class GetMyDepositInitialState extends GetMyDepositState {}

class GetMyDepositLoadingState extends GetMyDepositState {}

class GetMyDepositErrorState extends GetMyDepositState {
  final String message;
  GetMyDepositErrorState({required this.message});
}

class GetMyDepositLoadedState extends GetMyDepositState {
  final TransactionAmountVm? transactionAmountVm;
  GetMyDepositLoadedState({required this.transactionAmountVm});
}
