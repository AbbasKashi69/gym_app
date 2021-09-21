import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/SubscriptionTypeService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'get_subscription_event.dart';

part 'get_subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  SubscriptionBloc() : super(SubscriptionInitialState());
  SubscriptionTypeService _subscriptionTypeService = SubscriptionTypeService();

  @override
  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    if (event is SubscriptionLoadingEvent) {
      yield SubscriptionLoadingState();
      try {
        var data = await _subscriptionTypeService.getUserCurrentSubscription();
        yield SubscriptionLoadedState(resultObject: data);
      } catch (e) {
        print('Error ' + e.toString());
        yield SubscriptionErrorState(message: e.toString());
      }
    }
  }
}
