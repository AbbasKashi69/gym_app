import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/BodyBuildingMovementService.dart';
import 'package:gym_app/Services/DietPlanTypeService.dart';
import 'package:gym_app/ViewModels/BodyBuildingMovement/BodyBuildingMovementVm.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class CreateBodyBuildingMovementBloc
    extends Bloc<CreateBodyBuildingMovementEvent, CreateBodyBuildingMovementState> {
  CreateBodyBuildingMovementBloc() : super(CreateBodyBuildingMovementInitialSate());
  BodyBuildingMovementService _bodyBuildingMovementService = BodyBuildingMovementService();

  @override
  Stream<CreateBodyBuildingMovementState> mapEventToState(
      CreateBodyBuildingMovementEvent event,
      ) async* {
    if (event is CreateBodyBuildingMovementLoadingEvent) {
      yield CreateBodyBuildingMovementLoadingState();
      try {
        var data = await _bodyBuildingMovementService
            .create(event.bodyBuildingMovementVm);
        yield CreateBodyBuildingMovementLoadedState(resultObject: data);
      } catch (e) {
        print('error in create using form diet loaded state' + e.toString());
        yield CreateBodyBuildingMovementErrorState(message: e.toString());
      }
    }
  }
}
