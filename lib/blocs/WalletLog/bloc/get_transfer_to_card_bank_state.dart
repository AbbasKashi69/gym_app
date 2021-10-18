part of 'get_transfer_to_card_bank_bloc.dart';

@immutable
abstract class GetTransferToCardBankState {}

class GetTransferToCardBankInitialState extends GetTransferToCardBankState {}

class GetTransferToCardBankLoadingState extends GetTransferToCardBankState {}

class GetTransferToCardBankErrorState extends GetTransferToCardBankState {
  final String message;
  GetTransferToCardBankErrorState({required this.message});
}

class GetTransferToCardBankLoadedState extends GetTransferToCardBankState {
  final Page_MoneyRequestVm? page_moneyRequestVm;
  GetTransferToCardBankLoadedState({required this.page_moneyRequestVm});
  GetTransferToCardBankLoadedState copyWith(Page_MoneyRequestVm? newList) {
    return GetTransferToCardBankLoadedState(
        page_moneyRequestVm: newList ?? page_moneyRequestVm);
  }
}
