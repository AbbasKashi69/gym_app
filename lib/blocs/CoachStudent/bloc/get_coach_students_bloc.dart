import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/CoachStudentService.dart';
import 'package:gym_app/ViewModels/CoachStudent/Page_CoachStudentVm.dart';
import 'package:meta/meta.dart';

part 'get_coach_students_event.dart';
part 'get_coach_students_state.dart';

class GetCoachStudentsBloc
    extends Bloc<GetCoachStudentsEvent, GetCoachStudentsState> {
  GetCoachStudentsBloc() : super(GetCoachStudentsInitial());
  CoachStudentService _coachStudentService = CoachStudentService();
  @override
  Stream<GetCoachStudentsState> mapEventToState(
    GetCoachStudentsEvent event,
  ) async* {
    if (event is GetCoachStudentsLoadingEvent) {
      try {
        yield GetCoachStudentsLoadingState();
        var data =
            await _coachStudentService.getCoachStudents(event.coachId, 1);
        yield GetCoachStudentsLoadedState(page_coachStudentVm: data);
      } catch (e) {
        print('error in GetCoachStudents loaded state ' + e.toString());
        yield GetCoachStudentsErrorSatte(message: e.toString());
      }
    } else if (event is GetCoachStudentsLoadedEvent) {
      var oldState = state as GetCoachStudentsLoadedState;
      Page_CoachStudentVm? newList;
      if (oldState.page_coachStudentVm!.hasNext!) {
        newList = await _coachStudentService.getCoachStudents(
            event.coachId, oldState.page_coachStudentVm!.currentPage! + 1);
        newList!.items = oldState.page_coachStudentVm!.items! + newList.items!;
        // ignore: unnecessary_null_comparison
        if (newList != null &&
            newList.items != null &&
            newList.items!.isNotEmpty)
          yield GetCoachStudentsLoadedState(page_coachStudentVm: newList);
        else
          yield oldState.copyWith(oldState.page_coachStudentVm);
      }
    }
  }
}
