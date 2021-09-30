import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/CoachStudentService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'request_to_coach_event.dart';
part 'request_to_coach_state.dart';

class RequestToCoachBloc
    extends Bloc<RequestToCoachEvent, RequestToCoachState> {
  RequestToCoachBloc() : super(RequestToCoachInitialState());
  CoachStudentService _coachStudentService = CoachStudentService();

  @override
  Stream<RequestToCoachState> mapEventToState(
    RequestToCoachEvent event,
  ) async* {
    if (event is RequestToCoachLoadingEvent)
      try {
        yield RequestToCoachLoadingState(coachId: event.coachId);
        var data = await _coachStudentService.requestToCoach(event.coachId);
        yield RequestToCoachLoadedState(
            resultObject: data, coachId: event.coachId);
      } catch (e) {
        print('erro in request to coach loaded state ');
        yield RequestToCoachErrorSatte(message: e.toString());
      }
  }
}
