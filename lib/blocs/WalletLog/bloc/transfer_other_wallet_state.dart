part of 'transfer_other_wallet_bloc.dart';

@immutable
abstract class TransferToOtherWalletState {}

class TransferToOtherWalletInitialState extends TransferToOtherWalletState {}

class TransferToOtherWalletLoadingState extends TransferToOtherWalletState {}

class TransferToOtherWalletErrorState extends TransferToOtherWalletState {
  final String message;
  TransferToOtherWalletErrorState({required this.message});
}

class TransferToOtherWalletLoadedState extends TransferToOtherWalletState {
  final ResultObject? resultObject;
  TransferToOtherWalletLoadedState({required this.resultObject});
}
