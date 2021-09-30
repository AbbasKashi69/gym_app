import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/TransactionService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionAmountVm.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionVm.dart';
import 'package:meta/meta.dart';
part 'get_my_withdrawal_event.dart';
part 'get_my_withdrawal_state.dart';

class GetWithdrawalBloc
    extends Bloc<GetMyWithdrawalEvent, GetMyWithdrawalState> {
  GetWithdrawalBloc() : super(GetMyWithdrawalInitialState());
  TransactionService _service = TransactionService();

  @override
  Stream<GetMyWithdrawalState> mapEventToState(
      GetMyWithdrawalEvent event,
      ) async* {
    if (event is GetMyWithdrawalLoadingEvent) {
      yield GetMyWithdrawalLoadingState();
      try {
        var data = await _service.getSumWithdrawal();
        yield GetMyWithdrawalLoadedState(transactionAmountVm: data);
      } catch (e) {
        print('error in get my wallet ballance loaded state ' + e.toString());
        yield GetMyWithdrawalErrorSatte(message: e.toString());
      }
    }
  }
}
