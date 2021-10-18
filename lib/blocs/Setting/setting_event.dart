part of 'setting_bloc.dart';


@immutable
abstract class CreateBodyBuildingMovementEvent {}

class CreateBodyBuildingMovementLoadingEvent extends CreateBodyBuildingMovementEvent {
  final BodyBuildingMovementVm bodyBuildingMovementVm;
  CreateBodyBuildingMovementLoadingEvent({required this.bodyBuildingMovementVm});
}
