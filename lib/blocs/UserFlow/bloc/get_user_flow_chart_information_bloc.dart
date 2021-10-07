import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/UserFlowService.dart';
import 'package:gym_app/ViewModels/UserFlow/userFlowChartVm.dart';
import 'package:meta/meta.dart';

part 'get_user_flow_chart_information_event.dart';
part 'get_user_flow_chart_information_state.dart';

class GetUserFlowChartInformationBloc extends Bloc<
    GetUserFlowChartInformationEvent, GetUserFlowChartInformationState> {
  GetUserFlowChartInformationBloc()
      : super(GetUserFlowChartInformationInitialState());
  UserFlowService _userFlowService = UserFlowService();

  @override
  Stream<GetUserFlowChartInformationState> mapEventToState(
      GetUserFlowChartInformationEvent event) async* {
    {
      if (event is GetUserFlowChartInformationLoadingEvent) {
        yield GetUserFlowChartInformationLoadingState();
        try {
          var data = await _userFlowService.getUserFlowChartInformation(
              event.studentId, event.coachId);
          yield GetUserFlowChartInformationLoadedState(
              listUserFlowChartVm: data);
        } catch (e) {
          print('error in get user flow chart information  state ' +
              e.toString());
          yield GetUserFlowChartInformationErrorSatte(message: e.toString());
        }
      }
    }
  }
}
