part of 'create_using_form_body_building_bloc.dart';

@immutable
abstract class CreateUsingFormBodyBuildingEvent {}

class CreateUsingFormBodyBuildingLoadingEvent
    extends CreateUsingFormBodyBuildingEvent {
  final BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm;
  CreateUsingFormBodyBuildingLoadingEvent(
      {required this.bodyBuildingPlanTypeFormVm});
}
