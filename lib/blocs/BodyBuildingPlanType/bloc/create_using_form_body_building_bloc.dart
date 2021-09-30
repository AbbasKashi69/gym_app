import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/BodyBuildingPlanTypeService.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanType/BodyBuildingPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'create_using_form_body_building_event.dart';
part 'create_using_form_body_building_state.dart';

class CreateUsingFormBodyBuildingBloc extends Bloc<
    CreateUsingFormBodyBuildingEvent, CreateUsingFormBodyBuildingState> {
  CreateUsingFormBodyBuildingBloc()
      : super(CreateUsingFormBodyBuildingInitialState());
  BodyBuildingPlanTypeService _bodyBuildingPlanTypeService =
      BodyBuildingPlanTypeService();

  @override
  Stream<CreateUsingFormBodyBuildingState> mapEventToState(
    CreateUsingFormBodyBuildingEvent event,
  ) async* {
    if (event is CreateUsingFormBodyBuildingLoadingEvent) {
      yield CreateUsingFormBodyBuildingLoadingState();
      try {
        var data = await _bodyBuildingPlanTypeService
            .createUsingForm(event.bodyBuildingPlanTypeFormVm);
        yield CreateUsingFormBodyBuildingLoadedState(resultObject: data);
      } catch (e) {
        print('error in create using form body building loaded state' +
            e.toString());
        yield CreateUsingFormBodyBuildingErrorSatte(message: e.toString());
      }
    }
  }
}
