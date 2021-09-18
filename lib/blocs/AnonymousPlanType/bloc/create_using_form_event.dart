part of 'create_using_form_bloc.dart';

@immutable
abstract class CreateUsingFormOtherSportsEvent {}

class CreateUsingFormOtherSportsLoadingEvent
    extends CreateUsingFormOtherSportsEvent {
  final AnonymousPlantypeFormVm anonymousPlantypeFormVm;
  CreateUsingFormOtherSportsLoadingEvent(
      {required this.anonymousPlantypeFormVm});
}
