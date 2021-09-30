import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/TransactionService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionAmountVm.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionVm.dart';
import 'package:meta/meta.dart';
part 'get_my_deposit_event.dart';
part 'get_my_deposit_state.dart';

class GetMyDepositBloc
    extends Bloc<GetMyDepositEvent, GetMyDepositState> {
  GetMyDepositBloc() : super(GetMyDepositInitialState());
  TransactionService _service = TransactionService();

  @override
  Stream<GetMyDepositState> mapEventToState(
      GetMyDepositEvent event,
      ) async* {
    if (event is GetMyDepositLoadingEvent) {
      yield GetMyDepositLoadingState();
      try {
        var data = await _service.getSumDeposit();
        yield GetMyDepositLoadedState(transactionAmountVm: data);
      } catch (e) {
        print('error in get my wallet ballance loaded state ' + e.toString());
        yield GetMyDepositErrorState(message: e.toString());
      }
    }
  }
}
