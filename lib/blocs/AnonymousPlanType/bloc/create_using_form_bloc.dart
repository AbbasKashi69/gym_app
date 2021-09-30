import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AnonymousPlanTypeService.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'create_using_form_event.dart';
part 'create_using_form_state.dart';

class CreateUsingFormOthersSportsBloc extends Bloc<
    CreateUsingFormOtherSportsEvent, CreateUsingFormOthersSportsState> {
  CreateUsingFormOthersSportsBloc()
      : super(CreateUsingFormOthersSportsInitialState());
  AnonymousPlanTypeService _anonymousPlanTypeService =
      AnonymousPlanTypeService();

  @override
  Stream<CreateUsingFormOthersSportsState> mapEventToState(
    CreateUsingFormOtherSportsEvent event,
  ) async* {
    if (event is CreateUsingFormOtherSportsLoadingEvent) {
      yield CreateUsingFormOthersSportsLoadingState();
      try {
        var data = await _anonymousPlanTypeService
            .createUsingForm(event.anonymousPlantypeFormVm);
        yield CreateUsingFormOthersSportsLoadedState(resultObject: data);
      } catch (e) {
        print('error in registerloaded state' + e.toString());
        yield CreateUsingFormOthersSportsErrorSatte(message: e.toString());
      }
    }
  }
}
