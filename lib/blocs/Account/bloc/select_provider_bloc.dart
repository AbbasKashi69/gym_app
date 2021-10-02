import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AccountService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'select_provider_event.dart';
part 'select_provider_state.dart';

class SelectProviderBloc
    extends Bloc<SelectProviderEvent, SelectProviderState> {
  SelectProviderBloc() : super(SelectProviderInitialState());
  AccountService _accountService = AccountService();

  @override
  Stream<SelectProviderState> mapEventToState(
    SelectProviderEvent event,
  ) async* {
    if (event is SelectProviderLoadingEvent) {
      yield SelectProviderLoadingState();
      try {
        var data = await _accountService.selectProvider(event.userName);
        yield SelectProviderLoadedState(resultObject: data);
      } catch (e) {
        print('error in select provider loaded state ' + e.toString());
        yield SelectProviderErrorState(message: e.toString());
      }
    }
  }
}
