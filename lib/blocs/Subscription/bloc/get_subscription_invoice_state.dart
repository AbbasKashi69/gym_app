part of 'get_subscription_invoice_bloc.dart';

@immutable
abstract class GetSubscriptionInvoiceState {}

class GetSubscriptionInvoiceInitialState extends GetSubscriptionInvoiceState {}

class GetSubscriptionInvoiceLoadingState extends GetSubscriptionInvoiceState {}

class GetSubscriptionInvoiceErrorState extends GetSubscriptionInvoiceState {
  final String message;
  GetSubscriptionInvoiceErrorState({required this.message});
}

class GetSubscriptionInvoiceLoadedState extends GetSubscriptionInvoiceState {
  final Page_SubscriptionTypeInvoiceListVm? page_subscriptionTypeInvoiceListVm;
  GetSubscriptionInvoiceLoadedState({required this.page_subscriptionTypeInvoiceListVm});
  GetSubscriptionInvoiceLoadedState copyWith(Page_SubscriptionTypeInvoiceListVm? newList) {
    return GetSubscriptionInvoiceLoadedState(
        page_subscriptionTypeInvoiceListVm: newList ?? page_subscriptionTypeInvoiceListVm);
  }
}
