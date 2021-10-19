import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/MoneyRequestService.dart';
import 'package:gym_app/Services/PlanTypeService.dart';
import 'package:gym_app/Services/TransactionService.dart';
import 'package:gym_app/Services/WalletLogService.dart';
import 'package:gym_app/ViewModels/MoneyRequest/MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/MoneyRequest/Page_MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/Page_PlanTypeLogVm.dart';
import 'package:gym_app/ViewModels/Transaction/Page_TransactionVm.dart';
import 'package:gym_app/ViewModels/WalletLog/Page_WallteLogVm.dart';
import 'package:meta/meta.dart';

part 'get_transfer_to_card_bank_state.dart';

part 'get_transfer_to_card_bank_event.dart';

class GetTransferToCardBankBloc extends Bloc<GetTransferToCardBankEvent, GetTransferToCardBankState> {
  GetTransferToCardBankBloc() : super(GetTransferToCardBankInitialState());
  MoneyRequestService _moneyRequestService = MoneyRequestService();

  @override
  Stream<GetTransferToCardBankState> mapEventToState(
      GetTransferToCardBankEvent event,
      )  async* {
    if (event is GetTransferToCardBankLoadingEvent) {
      try {
        yield GetTransferToCardBankLoadingState();
        var data =
        await _moneyRequestService.getTransferToCardBank(event.pageSize??10, event.pageNumber??1);
        yield GetTransferToCardBankLoadedState(page_moneyRequestVm: data);
      } catch (e) {
        print('error in loaded state ' + e.toString());
        yield GetTransferToCardBankErrorState(message: e.toString());
      }
    } else if (event is GetTransferToCardBankLoadedEvent) {
      var oldState = state as GetTransferToCardBankLoadedState;
      Page_MoneyRequestVm? newList;
      if (oldState.page_moneyRequestVm!.hasNext!) {
        newList = await _moneyRequestService.getTransferToCardBank(
            event.pageSize??10, oldState.page_moneyRequestVm!.currentPage! + 1);
        newList!.items = oldState.page_moneyRequestVm!.items! + newList.items!;
        // ignore: unnecessary_null_comparison
        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetTransferToCardBankLoadedState(page_moneyRequestVm: newList);
        else
          yield oldState.copyWith(oldState.page_moneyRequestVm);
      }
    }
  }
}
