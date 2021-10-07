import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/CoachStudentService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'chage_status_by_id_event.dart';
part 'chage_status_by_id_state.dart';

class ChangeStatusByIdBloc
    extends Bloc<ChangeStatusByIdEvent, ChangeStatusByIdState> {
  ChangeStatusByIdBloc() : super(ChangeStatusByIdInitialState());
  CoachStudentService _coachStudentService = CoachStudentService();

  @override
  Stream<ChangeStatusByIdState> mapEventToState(
      ChangeStatusByIdEvent event) async* {
    if (event is ChangeStatusByIdLoadingEvent) {
      yield ChangeStatusByIdLoadingState(id: event.id);
      try {
        var data = await _coachStudentService.changeStatusById(
            event.coachId, event.studentId, event.isAccepted);
        yield ChangeStatusByIdLoadedState(resultObject: data);
      } catch (e) {
        print('error in change statusById loaded state ' + e.toString());
        yield ChangeStatusByIdErrorSatte(message: e.toString());
      }
    }
  }
}
