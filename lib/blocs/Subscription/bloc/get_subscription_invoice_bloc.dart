import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/SubscriptionTypeInvoiceService.dart';
import 'package:gym_app/ViewModels/SubscriptionTypeInvoice/Page_SubscriptionTypeInvoiceListVm.dart';

import 'package:meta/meta.dart';
part 'get_subscription_invoice_event.dart';
part 'get_subscription_invoice_state.dart';

class GetSubscriptionInvoiceBloc
    extends Bloc<GetSubscriptionInvoiceEvent, GetSubscriptionInvoiceState> {
  GetSubscriptionInvoiceBloc() : super(GetSubscriptionInvoiceInitialState());
  SubscriptionTypeInvoiceService _subscriptionTypeInvoiceService = SubscriptionTypeInvoiceService();

  @override
  Stream<GetSubscriptionInvoiceState> mapEventToState(
      GetSubscriptionInvoiceEvent event,
      ) async* {
    if (event is GetSubscriptionInvoiceLoadingEvent) {
      try {
        yield GetSubscriptionInvoiceLoadingState();
        var data = await _subscriptionTypeInvoiceService.getUserSubscriptionHistory();
        yield GetSubscriptionInvoiceLoadedState( page_subscriptionTypeInvoiceListVm: data);
      } catch (e) {
        print('error in state ' + e.toString());
        yield GetSubscriptionInvoiceErrorState(message: e.toString());
      }
    } else if (event is GetSubscriptionInvoiceLoadedState) {
      var oldState = state as GetSubscriptionInvoiceLoadedState;
      Page_SubscriptionTypeInvoiceListVm? newList;
      if (oldState.page_subscriptionTypeInvoiceListVm!.hasNext!) {
        newList = await _subscriptionTypeInvoiceService.getUserSubscriptionHistory(oldState.page_subscriptionTypeInvoiceListVm!.currentPage! + 1);
        newList!.items = oldState.page_subscriptionTypeInvoiceListVm!.items! + newList.items!;

        // ignore: unnecessary_null_comparison
        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetSubscriptionInvoiceLoadedState(page_subscriptionTypeInvoiceListVm: newList);
        else
          yield oldState.copyWith(oldState.page_subscriptionTypeInvoiceListVm);
      }
    }
  }
}
