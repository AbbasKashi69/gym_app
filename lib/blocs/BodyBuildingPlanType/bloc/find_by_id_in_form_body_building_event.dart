part of 'find_by_id_in_form_body_building_bloc.dart';

@immutable
abstract class FindByIdInFormBodyBuildingEvent {}

class FindByIdInFormBodyBuildingLoadingEvent
    extends FindByIdInFormBodyBuildingEvent {
  final int id;
  FindByIdInFormBodyBuildingLoadingEvent({required this.id});
}
