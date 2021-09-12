import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/PlanTypeService.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/Page_PlanTypeLogVm.dart';
import 'package:meta/meta.dart';

part 'get_plans_by_sort_event.dart';
part 'get_plans_by_sort_state.dart';

class GetPlansBySortBloc
    extends Bloc<GetPlansBySortEvent, GetPlansBySortState> {
  GetPlansBySortBloc() : super(GetPlansBySortInitialState());
  PlanTypeService _planTypeService = PlanTypeService();

  @override
  Stream<GetPlansBySortState> mapEventToState(
    GetPlansBySortEvent event,
  ) async* {
    if (event is GetPlansBySortLoadingEvent) {
      try {
        yield GetPlansBySortLoadingState();
        var data = await _planTypeService.getPlansBySort(
            event.coachId,
            event.studentId,
            event.planType,
            event.planStatusList ?? '',
            event.searchText ?? '',
            event.setCoachId,
            event.setStudentId);
        yield GetPlansBySortLoadedState(page_planTypeLogVm: data);
      } catch (e) {
        print('error in plantypeloaded state ' + e.toString());
        yield GetPlansBySortErrorSatte(message: e.toString());
      }
    } else if (event is GetPlansBySortLoadedEvent) {
      var oldState = state as GetPlansBySortLoadedState;
      Page_PlanTypeLogVm? newList;
      if (oldState.page_planTypeLogVm!.hasNext!) {
        newList = await _planTypeService.getPlansBySort(
            event.coachId,
            event.studentId,
            event.planType,
            event.planStatusList,
            event.searchText,
            event.setCoachId,
            event.setStudentId,
            oldState.page_planTypeLogVm!.currentPage! + 1);
        newList!.items = oldState.page_planTypeLogVm!.items! + newList.items!;
        // ignore: unnecessary_null_comparison
        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetPlansBySortLoadedState(page_planTypeLogVm: newList);
        else
          yield oldState.copyWith(oldState.page_planTypeLogVm);
      }
    }
  }
}
