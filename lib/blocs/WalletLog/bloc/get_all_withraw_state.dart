part of 'get_all_withraw_bloc.dart';




@immutable
abstract class GetAllWithdrawalState {}

class GetAllWithdrawalInitialState extends GetAllWithdrawalState {}

class GetAllWithdrawalLoadingState extends GetAllWithdrawalState {}

class GetAllWithdrawalErrorState extends GetAllWithdrawalState {
  final String message;
  GetAllWithdrawalErrorState({required this.message});
}

class GetAllWithdrawalLoadedState extends GetAllWithdrawalState {
  final Page_MoneyRequestVm? page_moneyRequestVm;
  GetAllWithdrawalLoadedState({required this.page_moneyRequestVm});
  GetAllWithdrawalLoadedState copyWith(Page_MoneyRequestVm? newList) {
    return GetAllWithdrawalLoadedState(
        page_moneyRequestVm: newList ?? page_moneyRequestVm);
  }
}
