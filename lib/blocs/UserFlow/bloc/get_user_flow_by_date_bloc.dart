import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/UserFlowService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'get_user_flow_by_date_event.dart';
part 'get_user_flow_by_date_state.dart';

class GetUserFlowByDateBloc
    extends Bloc<GetUserFlowByDateEvent, GetUserFlowByDateState> {
  GetUserFlowByDateBloc() : super(GetUserFlowByDateInitialState());
  UserFlowService _userFlowService = UserFlowService();

  @override
  Stream<GetUserFlowByDateState> mapEventToState(
      GetUserFlowByDateEvent event) async* {
    if (event is GetUserFlowByDateLoadingEvent) {
      yield GetUserFlowByDateLoadingState();
      try {
        var data = await _userFlowService.getUserFlowByDate(
            event.studentId, event.coachId, event.date);
        yield GetUserFlowByDateLoadedState(resultObject: data);
      } catch (e) {
        print('error in get user flow by date state ' + e.toString());
        yield GetUserFlowByDateErrorSatte(message: e.toString());
      }
    }
  }
}
