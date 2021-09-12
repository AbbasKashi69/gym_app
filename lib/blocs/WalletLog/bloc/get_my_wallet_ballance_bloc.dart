import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/WalletLogService.dart';
import 'package:gym_app/ViewModels/WalletLog/UserWalletVm.dart';
import 'package:meta/meta.dart';

part 'get_my_wallet_ballance_event.dart';
part 'get_my_wallet_ballance_state.dart';

class GetMyWalletBallanceBloc
    extends Bloc<GetMyWalletBallanceEvent, GetMyWalletBallanceState> {
  GetMyWalletBallanceBloc() : super(GetMyWalletBallanceInitialState());
  WalletLogService _walletLogService = WalletLogService();

  @override
  Stream<GetMyWalletBallanceState> mapEventToState(
    GetMyWalletBallanceEvent event,
  ) async* {
    if (event is GetMyWalletBallanceLoadingEvent) {
      yield GetMyWalletBallanceLoadingState();
      try {
        var data = await _walletLogService.getMyWalletBallance();
        yield GetMyWalletBallanceLoadedState(userWalletVm: data);
      } catch (e) {
        print('error in get my wallet ballance loaded state ' + e.toString());
        yield GetMyWalletBallanceErrorSatte(message: e.toString());
      }
    }
  }
}
