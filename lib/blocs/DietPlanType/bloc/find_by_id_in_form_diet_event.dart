part of 'find_by_id_in_form_diet_bloc.dart';

@immutable
abstract class FindByIdInFormDietEvent {}

class FindByIdInFormDietLoadingEvent extends FindByIdInFormDietEvent {
  final int id;
  FindByIdInFormDietLoadingEvent({required this.id});
}
