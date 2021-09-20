import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/CoachStudentService.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:meta/meta.dart';

part 'get_student_coaches_event.dart';
part 'get_student_coaches_state.dart';

class GetStudentCoachesBloc
    extends Bloc<GetStudentCoachesEvent, GetStudentCoachesState> {
  GetStudentCoachesBloc() : super(GetStudentCoachesInitialState());
  CoachStudentService _coachStudentService = CoachStudentService();

  @override
  Stream<GetStudentCoachesState> mapEventToState(
    GetStudentCoachesEvent event,
  ) async* {
    if (event is GetStudentCoachesLoadingEvent)
      try {
        yield GetStudentCoachesLoadingState();
        var data = await _coachStudentService.getStudentCoaches();
        yield GetStudentCoachesLoadedState(listCoachStudentVm: data);
      } catch (e) {
        print('erro in get students coaches loaded state ');
        yield GetStudentCoachesErrorSatte(message: e.toString());
      }
  }
}
