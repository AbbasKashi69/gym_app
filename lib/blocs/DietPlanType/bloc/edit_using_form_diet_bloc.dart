import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/DietPlanTypeService.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'edit_using_form_diet_event.dart';
part 'edit_using_form_diet_state.dart';

class EditUsingFormDietBloc
    extends Bloc<EditUsingFormDietEvent, EditUsingFormDietState> {
  EditUsingFormDietBloc() : super(EditUsingFormDietInitialState());
  DietPlanTypeService _dietPlanTypeService = DietPlanTypeService();

  @override
  Stream<EditUsingFormDietState> mapEventToState(
      EditUsingFormDietEvent event) async* {
    if (event is EditUsingFormDietLoadingEvent) {
      yield EditUsingFormDietLoadingState();
      try {
        var data =
            await _dietPlanTypeService.editUsingForm(event.dietPlanTypeFormVm);
        yield EditUsingFormDietLoadedState(resultObject: data);
      } catch (e) {
        print('error in edit using form diet loaded state' + e.toString());
        yield EditUsingFormDietErrorSatte(message: e.toString());
      }
    }
  }
}
