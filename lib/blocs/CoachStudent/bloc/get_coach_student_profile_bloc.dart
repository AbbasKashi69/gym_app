import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/CoachStudentService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'get_coach_student_profile_event.dart';
part 'get_coach_student_profile_state.dart';

class GetCoachStudentProfileBloc
    extends Bloc<GetCoachStudentProfileEvent, GetCoachStudentProfileState> {
  GetCoachStudentProfileBloc() : super(GetCoachStudentProfileInitialState());
  CoachStudentService _coachStudentService = CoachStudentService();

  @override
  Stream<GetCoachStudentProfileState> mapEventToState(
      GetCoachStudentProfileEvent event) async* {
    if (event is GetCoachStudentProfileLoadingEvent) {
      yield GetCoachStudentProfileLoadingState();
      try {
        var data = await _coachStudentService.getCoachStudentProfile(
            event.coachId, event.studentId);
        yield GetCoachStudentProfileLoadedState(resultObject: data);
      } catch (e) {
        print(
            'error in get coach studetn student profile state ' + e.toString());
        yield GetCoachStudentProfileErrorSatte(message: e.toString());
      }
    }
  }
}
