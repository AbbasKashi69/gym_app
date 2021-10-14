import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/BodyBuildingPlanTypeService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'find_by_id_in_form_body_building_event.dart';
part 'find_by_id_in_form_body_building_state.dart';

class FindByIdInFormBodyBuildingBloc extends Bloc<
    FindByIdInFormBodyBuildingEvent, FindByIdInFormBodyBuildingState> {
  FindByIdInFormBodyBuildingBloc()
      : super(FindByIdInFormBodyBuildingInitialState());
  BodyBuildingPlanTypeService _bodyBuildingPlanTypeService =
      BodyBuildingPlanTypeService();

  @override
  Stream<FindByIdInFormBodyBuildingState> mapEventToState(
      FindByIdInFormBodyBuildingEvent event) async* {
    if (event is FindByIdInFormBodyBuildingLoadingEvent) {
      yield FindByIdInFormBodyBuildingLoadingState();
      try {
        var data = await _bodyBuildingPlanTypeService.findByIdInForm(event.id);
        yield FindByIdInFormBodyBuildingLoadedState(resultObject: data);
      } catch (e) {
        print('error in Find By Id In Form body building state' + e.toString());
        yield FindByIdInFormBodyBuildingErrorSatte(message: e.toString());
      }
    }
  }
}
