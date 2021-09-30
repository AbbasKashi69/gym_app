part of 'increase_bloc.dart';

@immutable
abstract class IncreaseEvent {}

class IncreaseLoadingEvent extends IncreaseEvent {
  final IncreaseCreditVm increaseCreditVm;
  IncreaseLoadingEvent({required this.increaseCreditVm});
}
