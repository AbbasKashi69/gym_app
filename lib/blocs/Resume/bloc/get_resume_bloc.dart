import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/ResumeService.dart';
import 'package:gym_app/ViewModels/Resume/ResumeVm.dart';
import 'package:meta/meta.dart';

part 'get_resume_event.dart';
part 'get_resume_state.dart';

class GetResumeBloc extends Bloc<GetResumeEvent, GetResumeState> {
  GetResumeBloc() : super(GetResumeInitialState());
  ResumeService _resumeService = ResumeService();

  @override
  Stream<GetResumeState> mapEventToState(
    GetResumeEvent event,
  ) async* {
    if (event is GetResumeLoadingEvent) {
      yield GetResumeLoadingState();
      print("2");
      try {
        var data = await _resumeService.getResumeByCoachId(event.coachId);
        yield GetResumeLoadedState(resumeVm: data);
        print("1");
      } catch (e) {
        print('error in get resume loaded state ' + e.toString());
        yield GetResumeErrorState(message: e.toString());
      }
    }
  }
}
