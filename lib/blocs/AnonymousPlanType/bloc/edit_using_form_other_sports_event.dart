part of 'edit_using_form_other_sports_bloc.dart';

@immutable
abstract class EditUsingFormOtherSportsEvent {}

class EditUsingFormOtherSportsLoadingEvent
    extends EditUsingFormOtherSportsEvent {
  final AnonymousPlantypeFormVm anonymousPlantypeFormVm;
  EditUsingFormOtherSportsLoadingEvent({required this.anonymousPlantypeFormVm});
}
