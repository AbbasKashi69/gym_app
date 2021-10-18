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

part 'get_transfer_other_wallet_event.dart';

part 'get_transfer_other_wallet_state.dart';

class GetTransferToOthersWalletsBloc extends Bloc<GetTransferToOthersWalletsEvent, GetTransferToOthersWalletsState> {
  GetTransferToOthersWalletsBloc() : super(GetTransferToOthersWalletsInitialState());
  TransactionService _transactionService = TransactionService();

  @override
  Stream<GetTransferToOthersWalletsState> mapEventToState(
      GetTransferToOthersWalletsEvent event,
      )  async* {
    if (event is GetTransferToOthersWalletsLoadingEvent) {
      try {
        yield GetTransferToOthersWalletsLoadingState();
        var data =
        await _transactionService.getTransferToOthersWallets(event.pageSize??10, event.pageNumber??1);
        yield GetTransferToOthersWalletsLoadedState(page_transactionVm: data);
      } catch (e) {
        print('error in GetMyTransferBloc loaded state ' + e.toString());
        yield GetTransferToOthersWalletsErrorState(message: e.toString());
      }
    } else if (event is GetTransferToOthersWalletsLoadedEvent) {
      var oldState = state as GetTransferToOthersWalletsLoadedState;
      Page_TransactionVm? newList;
      if (oldState.page_transactionVm!.hasNext!) {
        newList = await _transactionService.getTransferToOthersWallets(
            event.pageSize??10, oldState.page_transactionVm!.currentPage! + 1);
        newList!.items = oldState.page_transactionVm!.items! + newList.items!;
        // ignore: unnecessary_null_comparison
        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetTransferToOthersWalletsLoadedState(page_transactionVm: newList);
        else
          yield oldState.copyWith(oldState.page_transactionVm);
      }
    }
  }
}
