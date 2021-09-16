part of 'create_using_form_bloc.dart';

@immutable
abstract class CreateUsingFormEvent {}

class CreateUsingFormLoadingEvent extends CreateUsingFormEvent {
  final AnonymousPlantypeFormVm anonymousPlantypeFormVm;
  CreateUsingFormLoadingEvent({required this.anonymousPlantypeFormVm});
}
