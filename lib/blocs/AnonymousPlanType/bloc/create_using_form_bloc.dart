import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AnonymousPlanTypeService.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'create_using_form_event.dart';
part 'create_using_form_state.dart';

class CreateUsingFormBloc
    extends Bloc<CreateUsingFormEvent, CreateUsingFormState> {
  CreateUsingFormBloc() : super(CreateUsingFormInitialState());
  AnonymousPlanTypeService _anonymousPlanTypeService =
      AnonymousPlanTypeService();

  @override
  Stream<CreateUsingFormState> mapEventToState(
    CreateUsingFormEvent event,
  ) async* {
    if (event is CreateUsingFormLoadingEvent) {
      try {
        var data = await _anonymousPlanTypeService
            .createUsingForm(event.anonymousPlantypeFormVm);
        yield CreateUsingFormLoadedState(resultObject: data);
      } catch (e) {
        print('error in registerloaded state' + e.toString());
        yield CreateUsingFormErrorSatte(message: e.toString());
      }
    }
  }
}
