import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/BodyBuildingMovementService.dart';
import 'package:gym_app/ViewModels/BodyBuildingMovement/BodyBuildingMovementVm.dart';
import 'package:meta/meta.dart';

part 'get_user_body_building_movement_list_event.dart';
part 'get_user_body_building_movement_list_state.dart';

class GetUserBodyBuildingMovementListBloc extends Bloc<
    GetUserBodyBuildingMovementListEvent,
    GetUserBodyBuildingMovementListState> {
  GetUserBodyBuildingMovementListBloc()
      : super(GetUserBodyBuildingMovementListInitialState());
  BodyBuildingMovementService _bodyBuildingMovementService =
      BodyBuildingMovementService();

  @override
  Stream<GetUserBodyBuildingMovementListState> mapEventToState(
    GetUserBodyBuildingMovementListEvent event,
  ) async* {
    if (event is GetUserBodyBuildingMovementListLoadingEvent)
      try {
        yield GetUserBodyBuildingMovementListLoadingState();
        var data = await _bodyBuildingMovementService
            .getUserBodyBuildingMovementList(event.searchText);
        yield GetUserBodyBuildingMovementListLoadedState(
            listBodyBuildingMovement: data);
      } catch (e) {
        print('erro in get getuser body building movement list loaded state ');
        yield GetUserBodyBuildingMovementListErrorSatte(message: e.toString());
      }
  }
}
