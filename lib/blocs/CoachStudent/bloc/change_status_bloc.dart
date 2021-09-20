import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/CoachStudentService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'change_status_event.dart';
part 'change_status_state.dart';

class ChangeStatusBloc extends Bloc<ChangeStatusEvent, ChangeStatusState> {
  ChangeStatusBloc() : super(ChangeStatusInitialState());
  CoachStudentService _coachStudentService = CoachStudentService();

  @override
  Stream<ChangeStatusState> mapEventToState(
    ChangeStatusEvent event,
  ) async* {
    if (event is ChangeStatusLoadingEvent) {
      yield ChangeStatusLoadingState(id: event.id);
      try {
        var data = await _coachStudentService.changeStatus(
            event.coachStudentId, event.isAccepted);
        yield ChangeStatusLoadedState(resultObject: data);
      } catch (e) {
        print('error in change status loaded state ' + e.toString());
        yield ChangeStatusErrorSatte(message: e.toString());
      }
    }
  }
}
