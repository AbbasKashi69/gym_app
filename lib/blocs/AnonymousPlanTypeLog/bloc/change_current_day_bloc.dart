import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AnonymousPlanTypeLogService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/request_to_coach_bloc.dart';
import 'package:meta/meta.dart';

part 'change_current_day_event.dart';
part 'change_current_day_state.dart';

class ChangeCurrentDayBloc
    extends Bloc<ChangeCurrentDayEvent, ChangeCurrentDayState> {
  ChangeCurrentDayBloc() : super(ChangeCurrentDayInitialState());
  AnonymousPlanTypeLogService _anonymousPlanTypeLogService =
      AnonymousPlanTypeLogService();

  @override
  Stream<ChangeCurrentDayState> mapEventToState(
      ChangeCurrentDayEvent event) async* {
    if (event is ChangeCurrentDayLoadingEvent) {
      yield ChangeCurrentDayLoadingState(index: event.index);
      try {
        var data = await _anonymousPlanTypeLogService.changeCurrentDay(
            event.planId, event.addedDay);
        yield ChangeCurrentDayLoadedState(resultObject: data);
      } catch (e) {
        print('error in change current day loaded state' + e.toString());
        yield ChangeCurrentDayErrorSatte(message: e.toString());
      }
    }
  }
}
