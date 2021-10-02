part of 'select_provider_bloc.dart';

@immutable
abstract class SelectProviderEvent {}

class SelectProviderLoadingEvent extends SelectProviderEvent {
  final String userName;
  SelectProviderLoadingEvent({required this.userName});
}
