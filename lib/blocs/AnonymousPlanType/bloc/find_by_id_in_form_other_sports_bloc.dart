import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AnonymousPlanTypeService.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'find_by_id_in_form_other_sports_event.dart';
part 'find_by_id_in_form_other_sports_state.dart';

class FindByIdInFormOtherSportsBloc extends Bloc<FindByIdInFormOtherSportsEvent,
    FindByIdInFormOtherSportsState> {
  FindByIdInFormOtherSportsBloc()
      : super(FindByIdInFormOtherSportsInitialState());
  AnonymousPlanTypeService _anonymousPlanTypeService =
      AnonymousPlanTypeService();

  @override
  Stream<FindByIdInFormOtherSportsState> mapEventToState(
      FindByIdInFormOtherSportsEvent event) async* {
    if (event is FindByIdInFormOtherSportsLoadingEvent) {
      yield FindByIdInFormOtherSportsLoadingState();
      try {
        var data = await _anonymousPlanTypeService.findByIdInForm(event.id);
        yield FindByIdInFormOtherSportsLoadedState(resultObject: data);
      } catch (e) {
        print('error in Find By Id In Form OtherSports state' + e.toString());
        yield FindByIdInFormOtherSportsErrorSatte(message: e.toString());
      }
    }
  }
}
