part of 'transfer_to_cart_bank_bloc.dart';

@immutable
abstract class TransferToCartBankState {}

class TransferToCartBankInitialState extends TransferToCartBankState {}

class TransferToCartBankLoadingState extends TransferToCartBankState {}

class TransferToCartBankErrorState extends TransferToCartBankState {
  final String message;
  TransferToCartBankErrorState({required this.message});
}

class TransferToCartBankLoadedState extends TransferToCartBankState {
  final ResultObject? resultObject;
  TransferToCartBankLoadedState({required this.resultObject});
}
