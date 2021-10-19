part of 'transfer_to_cart_bank_bloc.dart';

@immutable
abstract class TransferToCartBankEvent {}

class TransferToCartBankLoadingEvent extends TransferToCartBankEvent {
  final TransferToBankVm transferToBankVm;
  TransferToCartBankLoadingEvent({required this.transferToBankVm});
}
