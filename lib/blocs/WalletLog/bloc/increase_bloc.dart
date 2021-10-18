import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/WalletLogService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/WalletLog/IncreaseCreditVm.dart';
import 'package:meta/meta.dart';
part 'increase_event.dart';
part 'increase_state.dart';

class IncreaseBloc extends Bloc<IncreaseEvent, IncreaseState> {
  IncreaseBloc() : super(IncreaseInitialState());
  WalletLogService _logService = WalletLogService();

  @override
  Stream<IncreaseState> mapEventToState(
      IncreaseEvent event,
      ) async* {
    if (event is IncreaseLoadingEvent) {
      yield IncreaseLoadingState();
      try {
        var data = await _logService.increaseCredit(event.increaseCreditVm);
        yield IncreaseLoadedState(resultObject: data);

      } catch (e) {
        print('error in  state' + e.toString());
        yield IncreaseErrorState(message: e.toString());
      }
    }
  }
}
