part of 'transfer_other_wallet_bloc.dart';

@immutable
abstract class TransferToOtherWalletEvent {}

class TransferToOtherWalletLoadingEvent extends TransferToOtherWalletEvent {
  final TransferToOtherWalletsVm transferToOtherWalletVm;

  TransferToOtherWalletLoadingEvent({required this.transferToOtherWalletVm});


}
