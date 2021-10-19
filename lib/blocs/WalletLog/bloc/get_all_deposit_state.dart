part of 'get_all_deposit_bloc.dart';

@immutable
abstract class GetAllDepositState {}

class GetAllDepositInitialState extends GetAllDepositState {}

class GetAllDepositLoadingState extends GetAllDepositState {}

class GetAllDepositErrorState extends GetAllDepositState {
  final String message;
  GetAllDepositErrorState({required this.message});
}

class GetAllDepositLoadedState extends GetAllDepositState {
  final Page_MoneyRequestVm? page_moneyRequestVm;
  GetAllDepositLoadedState({required this.page_moneyRequestVm});
  GetAllDepositLoadedState copyWith(Page_MoneyRequestVm? newList) {
    return GetAllDepositLoadedState(
        page_moneyRequestVm: newList ?? page_moneyRequestVm);
  }
}
