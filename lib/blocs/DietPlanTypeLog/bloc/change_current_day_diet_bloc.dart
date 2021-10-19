import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/DietPlanTypeLogService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'change_current_day_diet_event.dart';
part 'change_current_day_diet_state.dart';

class ChangeCurrentDayDietBloc
    extends Bloc<ChangeCurrentDayDietEvent, ChangeCurrentDayDietState> {
  ChangeCurrentDayDietBloc() : super(ChangeCurrentDayDietInitialState());
  DietPlanTypeLogService _dietPlanTypeLogService = DietPlanTypeLogService();

  @override
  Stream<ChangeCurrentDayDietState> mapEventToState(
      ChangeCurrentDayDietEvent event) async* {
    if (event is ChangeCurrentDayDietLoadingEvent) {
      yield ChangeCurrentDayDietLoadingState(index: event.index);
      try {
        var data = await _dietPlanTypeLogService.changeCurrentDay(
            event.planId, event.addedDay);
        yield ChangeCurrentDayDietLoadedState(resultObject: data);
      } catch (e) {
        print('error in change current day Diet loaded state' + e.toString());
        yield ChangeCurrentDayDietErrorSatte(message: e.toString());
      }
    }
  }
}
