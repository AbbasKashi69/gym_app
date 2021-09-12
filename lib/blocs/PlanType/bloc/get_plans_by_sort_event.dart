part of 'get_plans_by_sort_bloc.dart';

@immutable
abstract class GetPlansBySortEvent {}

class GetPlansBySortLoadingEvent extends GetPlansBySortEvent {
  final int? coachId;
  final int? studentId;
  final int? planType;
  final String? planStatusList;
  final int? pageNumber;
  final String? searchText;
  final bool? setCoachId;
  final bool? setStudentId;
  GetPlansBySortLoadingEvent(
      {this.coachId,
      this.pageNumber,
      this.planStatusList,
      this.planType,
      this.searchText,
      this.setCoachId,
      this.setStudentId,
      this.studentId});
}

class GetPlansBySortLoadedEvent extends GetPlansBySortEvent {
  final int? coachId;
  final int? studentId;
  final int? planType;
  final String? planStatusList;
  final int? pageNumber;
  final String? searchText;
  final bool? setCoachId;
  final bool? setStudentId;
  GetPlansBySortLoadedEvent(
      {this.coachId,
      this.pageNumber,
      this.planStatusList,
      this.planType,
      this.searchText,
      this.setCoachId,
      this.setStudentId,
      this.studentId});
}
