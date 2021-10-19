import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/BodyBuildingPlanTypeLogService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'change_current_day_body_building_event.dart';
part 'change_current_day_body_building_state.dart';

class ChangeCurrentDayBodyBuildingBloc extends Bloc<
    ChangeCurrentDayBodyBuildingEvent, ChangeCurrentDayBodyBuildingState> {
  ChangeCurrentDayBodyBuildingBloc()
      : super(ChangeCurrentDayBodyBuildingInitialState());
  BodyBuildingPlanTypeLogService _bodyBuildingPlanTypeLogService =
      BodyBuildingPlanTypeLogService();

  @override
  Stream<ChangeCurrentDayBodyBuildingState> mapEventToState(
      ChangeCurrentDayBodyBuildingEvent event) async* {
    if (event is ChangeCurrentDayBodyBuildingLoadingEvent) {
      yield ChangeCurrentDayBodyBuildingLoadingState(index: event.index);
      try {
        var data = await _bodyBuildingPlanTypeLogService.changeCurrentDay(
            event.planId, event.addedDay);
        yield ChangeCurrentDayBodyBuildingLoadedState(resultObject: data);
      } catch (e) {
        print('error in change current day body building loaded state' +
            e.toString());
        yield ChangeCurrentDayBodyBuildingErrorSatte(message: e.toString());
      }
    }
  }
}
