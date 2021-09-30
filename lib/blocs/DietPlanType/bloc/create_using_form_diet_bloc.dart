import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/DietPlanTypeService.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'create_using_form_diet_event.dart';
part 'create_using_form_diet_state.dart';

class CreateUsingFormDietBloc
    extends Bloc<CreateUsingFormDietEvent, CreateUsingFormDietState> {
  CreateUsingFormDietBloc() : super(CreateUsingFormDietInitialSate());
  DietPlanTypeService _dietPlanTypeService = DietPlanTypeService();

  @override
  Stream<CreateUsingFormDietState> mapEventToState(
    CreateUsingFormDietEvent event,
  ) async* {
    if (event is CreateUsingFormDietLoadingEvent) {
      yield CreateUsingFormDietLoadingState();
      try {
        var data = await _dietPlanTypeService
            .createUsingForm(event.dietPlanTypeFormVm);
        yield CreateUsingFormDietLoadedState(resultObject: data);
      } catch (e) {
        print('error in create using form diet loaded state' + e.toString());
        yield CreateUsingFormDietErrorSatte(message: e.toString());
      }
    }
  }
}
