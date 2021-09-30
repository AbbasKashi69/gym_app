part of 'create_using_form_diet_bloc.dart';

@immutable
abstract class CreateUsingFormDietEvent {}

class CreateUsingFormDietLoadingEvent extends CreateUsingFormDietEvent {
  final DietPlanTypeFormVm dietPlanTypeFormVm;
  CreateUsingFormDietLoadingEvent({required this.dietPlanTypeFormVm});
}
