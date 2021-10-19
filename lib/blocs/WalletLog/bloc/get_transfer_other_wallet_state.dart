part of 'get_transfer_other_wallet_bloc.dart';


@immutable
abstract class GetTransferToOthersWalletsState {}

class GetTransferToOthersWalletsInitialState extends GetTransferToOthersWalletsState {}

class GetTransferToOthersWalletsLoadingState extends GetTransferToOthersWalletsState {}

class GetTransferToOthersWalletsErrorState extends GetTransferToOthersWalletsState {
  final String message;
  GetTransferToOthersWalletsErrorState({required this.message});
}

class GetTransferToOthersWalletsLoadedState extends GetTransferToOthersWalletsState {
  final Page_TransactionVm? page_transactionVm;
  GetTransferToOthersWalletsLoadedState({required this.page_transactionVm});
  GetTransferToOthersWalletsLoadedState copyWith(Page_TransactionVm? newList) {
    return GetTransferToOthersWalletsLoadedState(
        page_transactionVm: newList ?? page_transactionVm);
  }
}
