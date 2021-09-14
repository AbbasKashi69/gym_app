import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/CoachStudentService.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:meta/meta.dart';

part 'get_students_as_person_list_event.dart';
part 'get_students_as_person_list_state.dart';

class GetStudentsAsPersonListBloc
    extends Bloc<GetStudentsAsPersonListEvent, GetStudentsAsPersonListState> {
  GetStudentsAsPersonListBloc() : super(GetStudentsAsPersonListInitialState());
  CoachStudentService _coachStudentService = CoachStudentService();
  @override
  Stream<GetStudentsAsPersonListState> mapEventToState(
    GetStudentsAsPersonListEvent event,
  ) async* {
    if (event is GetStudentsAsPersonListLoadingEvent) {
      yield GetStudentsAsPersonListLoadingState();
      try {
        var data = await _coachStudentService.getStudentsAsPersonList(
            event.coachId, event.searchText ?? "");
        yield GetStudentsAsPersonListLoadedState(listPersonListVm: data);
      } catch (e) {
        print(
            'error in get students as personlst loaded state ' + e.toString());
        yield GetStudentsAsPersonListErrorSatte(message: e.toString());
      }
    }
  }
}
