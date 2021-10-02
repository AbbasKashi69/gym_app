part of 'edit_person_bloc.dart';

@immutable
abstract class EditPersonEvent {}

class EditPersonLoadingEvent extends EditPersonEvent {
  final PersonVm personVm;
  EditPersonLoadingEvent({required this.personVm});
}
