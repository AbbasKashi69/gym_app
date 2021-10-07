import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/UserFlowService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/UserFlow/UserFlowVm.dart';
import 'package:meta/meta.dart';

part 'create_user_flow_event.dart';
part 'create_user_flow_state.dart';

class CreateUserFlowBloc
    extends Bloc<CreateUserFlowEvent, CreateUserFlowState> {
  CreateUserFlowBloc() : super(CreateUserFlowInitialState());
  UserFlowService _userFlowService = UserFlowService();

  @override
  Stream<CreateUserFlowState> mapEventToState(
      CreateUserFlowEvent event) async* {
    if (event is CreateUserFlowLoadingEvent) {
      yield CreateUserFlowLoadingState();
      try {
        var data = await _userFlowService.create(event.userFlowVm);
        yield CreateUserFlowLoadedState(resultObject: data);
      } catch (e) {
        print('error in create user flow loaded state ' + e.toString());
        yield CreateUserFlowErrorSatte(message: e.toString());
      }
    }
  }
}
