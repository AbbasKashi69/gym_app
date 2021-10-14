part of 'edit_using_form_body_building_bloc.dart';

@immutable
abstract class EditUsingFormBodyBuildingEvent {}

class EditUsingFormBodyBuildingLoadingEvent
    extends EditUsingFormBodyBuildingEvent {
  final BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm;
  EditUsingFormBodyBuildingLoadingEvent(
      {required this.bodyBuildingPlanTypeFormVm});
}
