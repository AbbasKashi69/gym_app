import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/Services/TransactionService.dart';
import 'package:gym_app/Services/WalletLogService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionVm.dart';
import 'package:gym_app/ViewModels/WalletLog/IncreaseCreditVm.dart';
import 'package:gym_app/ViewModels/WalletLog/transferBankVm.dart';
import 'package:meta/meta.dart';
part 'transfer_to_cart_bank_event.dart';
part 'transfer_to_cart_bank_state.dart';

class TransferToCartBankBloc extends Bloc<TransferToCartBankEvent, TransferToCartBankState> {
  TransferToCartBankBloc() : super(TransferToCartBankInitialState());
  WalletLogService _walletLogService = WalletLogService();

  @override
  Stream<TransferToCartBankState> mapEventToState(
      TransferToCartBankEvent event,
      ) async* {
    if (event is TransferToCartBankLoadingEvent) {
      yield TransferToCartBankLoadingState();
      try {
        var data = await _walletLogService.transferToCardBank(event.transferToBankVm);
        yield TransferToCartBankLoadedState(resultObject: data);
      } catch (e) {
        print('error in  state' + e.toString());
        yield TransferToCartBankErrorState(message: e.toString());
      }
    }
  }
}
