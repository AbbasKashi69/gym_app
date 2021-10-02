part of 'select_provider_bloc.dart';

@immutable
abstract class SelectProviderState {}

class SelectProviderInitialState extends SelectProviderState {}

class SelectProviderLoadingState extends SelectProviderState {}

class SelectProviderLoadedState extends SelectProviderState {
  final ResultObject? resultObject;
  SelectProviderLoadedState({this.resultObject});
}

class SelectProviderErrorState extends SelectProviderState {
  final String message;
  SelectProviderErrorState({required this.message});
}
