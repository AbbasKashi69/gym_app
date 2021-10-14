import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/DietPlanTypeService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'find_by_id_in_form_diet_event.dart';
part 'find_by_id_in_form_diet_state.dart';

class FindByIdInFormDietBloc
    extends Bloc<FindByIdInFormDietEvent, FindByIdInFormDietState> {
  FindByIdInFormDietBloc() : super(FindByIdInFormDietInitialState());
  DietPlanTypeService _dietPlanTypeService = DietPlanTypeService();
  @override
  Stream<FindByIdInFormDietState> mapEventToState(
      FindByIdInFormDietEvent event) async* {
    if (event is FindByIdInFormDietLoadingEvent) {
      yield FindByIdInFormDietLoadingState();
      try {
        var data = await _dietPlanTypeService.findByIdInForm(event.id);
        yield FindByIdInFormDietLoadedState(resultObject: data);
      } catch (e) {
        print('error in Find By Id In Form diet state' + e.toString());
        yield FindByIdInFormDietErrorSatte(message: e.toString());
      }
    }
  }
}
