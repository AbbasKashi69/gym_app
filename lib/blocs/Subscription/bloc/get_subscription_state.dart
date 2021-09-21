part of 'get_subscription_bloc.dart';

@immutable
abstract class SubscriptionState {}

class SubscriptionInitialState extends SubscriptionState {}

class SubscriptionLoadingState extends SubscriptionState {}

class SubscriptionErrorState extends SubscriptionState {
  final String message;
  SubscriptionErrorState({required this.message});
}

class SubscriptionLoadedState extends SubscriptionState {
  final ResultObject? resultObject;
  SubscriptionLoadedState({this.resultObject});
}
