import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/Services/TransactionService.dart';
import 'package:gym_app/Services/WalletLogService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/Transaction/TransactionVm.dart';
import 'package:gym_app/ViewModels/WalletLog/IncreaseCreditVm.dart';
import 'package:gym_app/ViewModels/WalletLog/WalletLogVm.dart';
import 'package:gym_app/ViewModels/WalletLog/transferBankVm.dart';
import 'package:gym_app/ViewModels/WalletLog/transferToOtherWalletVm.dart';
import 'package:meta/meta.dart';

part 'transfer_other_wallet_state.dart';
part 'transfer_other_wallet_event.dart';

class TransferOtherWalletBloc extends Bloc<TransferToOtherWalletEvent, TransferToOtherWalletState> {
  TransferOtherWalletBloc() : super(TransferToOtherWalletInitialState());
  WalletLogService _walletLogService = WalletLogService();

  @override
  Stream<TransferToOtherWalletState> mapEventToState(
      TransferToOtherWalletEvent event,
      ) async* {
    if (event is TransferToOtherWalletLoadingEvent) {
      yield TransferToOtherWalletLoadingState();
      try {
        print("aaa1");
        var data = await _walletLogService.transferToOthersWallets(event.transferToOtherWalletVm);
        print("aaa2");
        yield TransferToOtherWalletLoadedState(resultObject: data);
        print("aaa3");
      } catch (e) {
        print('error in  state' + e.toString());
        yield TransferToOtherWalletErrorState(message: e.toString());
      }
    }
  }
}
