part of 'get_my_wallet_ballance_bloc.dart';

@immutable
abstract class GetMyWalletBallanceState {}

class GetMyWalletBallanceInitialState extends GetMyWalletBallanceState {}

class GetMyWalletBallanceLoadingState extends GetMyWalletBallanceState {}

class GetMyWalletBallanceErrorSatte extends GetMyWalletBallanceState {
  final String message;
  GetMyWalletBallanceErrorSatte({required this.message});
}

class GetMyWalletBallanceLoadedState extends GetMyWalletBallanceState {
  final UserWalletVm? userWalletVm;
  GetMyWalletBallanceLoadedState({required this.userWalletVm});
}
