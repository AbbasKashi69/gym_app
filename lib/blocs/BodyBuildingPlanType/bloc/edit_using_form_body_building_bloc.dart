import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/BodyBuildingPlanTypeService.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanType/BodyBuildingPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'edit_using_form_body_building_event.dart';
part 'edit_using_form_body_building_state.dart';

class EditUsingFormBodyBuildingBloc extends Bloc<EditUsingFormBodyBuildingEvent,
    EditUsingFormBodyBuildingState> {
  EditUsingFormBodyBuildingBloc()
      : super(EditUsingFormBodyBuildingInitialState());
  BodyBuildingPlanTypeService _bodyBuildingPlanTypeService =
      BodyBuildingPlanTypeService();

  @override
  Stream<EditUsingFormBodyBuildingState> mapEventToState(
      EditUsingFormBodyBuildingEvent event) async* {
    if (event is EditUsingFormBodyBuildingLoadingEvent) {
      yield EditUsingFormBodyBuildingLoadingState();
      try {
        var data = await _bodyBuildingPlanTypeService
            .editUsingForm(event.bodyBuildingPlanTypeFormVm);
        yield EditUsingFormBodyBuildingLoadedState(resultObject: data);
      } catch (e) {
        print('error in edit using form body building loaded state' +
            e.toString());
        yield EditUsingFormBodyBuildingErrorSatte(message: e.toString());
      }
    }
  }
}
