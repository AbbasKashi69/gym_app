import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/MoneyRequestService.dart';
import 'package:gym_app/Services/PlanTypeService.dart';
import 'package:gym_app/Services/WalletLogService.dart';
import 'package:gym_app/ViewModels/MoneyRequest/MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/MoneyRequest/Page_MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/Page_PlanTypeLogVm.dart';
import 'package:gym_app/ViewModels/WalletLog/Page_WallteLogVm.dart';
import 'package:meta/meta.dart';

part 'get_all_withraw_event.dart';

part 'get_all_withraw_state.dart';

class GetAllWithdrawalBloc extends Bloc<GetAllWithdrawalEvent, GetAllWithdrawalState> {
  GetAllWithdrawalBloc() : super(GetAllWithdrawalInitialState());
  MoneyRequestService _moneyRequestService = MoneyRequestService();

  @override
  Stream<GetAllWithdrawalState> mapEventToState(
    GetAllWithdrawalEvent event,
  )  async* {
    if (event is GetAllWithdrawalLoadingEvent) {
      try {
        yield GetAllWithdrawalLoadingState();
        var data =
        await _moneyRequestService.getWithdrawal(event.pageSize??10, event.pageNumber??1);
        yield GetAllWithdrawalLoadedState(page_moneyRequestVm: data);
      } catch (e) {
        print('error in GetMyTransferBloc loaded state ' + e.toString());
        yield GetAllWithdrawalErrorState(message: e.toString());
      }
    } else if (event is GetAllWithdrawalLoadedEvent) {
      var oldState = state as GetAllWithdrawalLoadedState;
      Page_MoneyRequestVm? newList;
      if (oldState.page_moneyRequestVm!.hasNext!) {
        newList = await _moneyRequestService.getDeposit(
            event.pageSize??10, oldState.page_moneyRequestVm!.currentPage! + 1);
        newList!.items = oldState.page_moneyRequestVm!.items! + newList.items!;
        // ignore: unnecessary_null_comparison
        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetAllWithdrawalLoadedState(page_moneyRequestVm: newList);
        else
          yield oldState.copyWith(oldState.page_moneyRequestVm);
      }
    }
  }
}
