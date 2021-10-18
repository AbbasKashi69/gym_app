import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/MoneyRequestService.dart';
import 'package:gym_app/Services/PlanTypeService.dart';
import 'package:gym_app/Services/WalletLogService.dart';
import 'package:gym_app/ViewModels/MoneyRequest/Page_MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/Page_PlanTypeLogVm.dart';
import 'package:gym_app/ViewModels/WalletLog/Page_WallteLogVm.dart';
import 'package:meta/meta.dart';

part 'get_all_deposit_event.dart';

part 'get_all_deposit_state.dart';

class GetAllDepositBloc extends Bloc<GetAllDepositEvent, GetAllDepositState> {
  GetAllDepositBloc() : super(GetAllDepositInitialState());
  MoneyRequestService _moneyRequestService = MoneyRequestService();

  @override
  Stream<GetAllDepositState> mapEventToState(
      GetAllDepositEvent event,
      )  async* {
    if (event is GetAllDepositLoadingEvent) {
      try {
        yield GetAllDepositLoadingState();
        var data =
        await _moneyRequestService.getDeposit(10, 1);
        yield GetAllDepositLoadedState(page_moneyRequestVm: data);
      } catch (e) {
        print('error in loaded state ' + e.toString());
        yield GetAllDepositErrorState(message: e.toString());
      }
    } else if (event is GetAllDepositLoadedEvent) {
      var oldState = state as GetAllDepositLoadedState;
      Page_MoneyRequestVm? newList;
      if (oldState.page_moneyRequestVm!.hasNext!) {
        newList = await _moneyRequestService.getDeposit(
            10, oldState.page_moneyRequestVm!.currentPage! + 1);
        newList!.items = oldState.page_moneyRequestVm!.items! + newList.items!;
        // ignore: unnecessary_null_comparison
        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetAllDepositLoadedState(page_moneyRequestVm: newList);
        else
          yield oldState.copyWith(oldState.page_moneyRequestVm);
      }
    }
  }
}
