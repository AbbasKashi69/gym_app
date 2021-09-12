part of 'get_plans_by_sort_bloc.dart';

@immutable
abstract class GetPlansBySortState {}

class GetPlansBySortInitialState extends GetPlansBySortState {}

class GetPlansBySortLoadingState extends GetPlansBySortState {}

class GetPlansBySortErrorSatte extends GetPlansBySortState {
  final String message;
  GetPlansBySortErrorSatte({required this.message});
}

class GetPlansBySortLoadedState extends GetPlansBySortState {
  final Page_PlanTypeLogVm? page_planTypeLogVm;
  GetPlansBySortLoadedState({required this.page_planTypeLogVm});
  GetPlansBySortLoadedState copyWith(Page_PlanTypeLogVm? newList) {
    return GetPlansBySortLoadedState(
        page_planTypeLogVm: newList ?? page_planTypeLogVm);
  }
}
