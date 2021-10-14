part of 'edit_using_form_diet_bloc.dart';

@immutable
abstract class EditUsingFormDietEvent {}

class EditUsingFormDietLoadingEvent extends EditUsingFormDietEvent {
  final DietPlanTypeFormVm dietPlanTypeFormVm;
  EditUsingFormDietLoadingEvent({required this.dietPlanTypeFormVm});
}
