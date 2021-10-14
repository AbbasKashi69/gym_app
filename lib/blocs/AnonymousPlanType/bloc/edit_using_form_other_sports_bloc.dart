import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/AnonymousPlanTypeService.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'edit_using_form_other_sports_event.dart';
part 'edit_using_form_other_sports_state.dart';

class EditUsingFormOtherSportsBloc
    extends Bloc<EditUsingFormOtherSportsEvent, EditUsingFormOtherSportsState> {
  EditUsingFormOtherSportsBloc()
      : super(EditUsingFormOtherSportsInitialState());
  AnonymousPlanTypeService _anonymousPlanTypeService =
      AnonymousPlanTypeService();

  @override
  Stream<EditUsingFormOtherSportsState> mapEventToState(
      EditUsingFormOtherSportsEvent event) async* {
    if (event is EditUsingFormOtherSportsLoadingEvent) {
      yield EditUsingFormOtherSportsLoadingState();
      try {
        var data = await _anonymousPlanTypeService
            .editUsingForm(event.anonymousPlantypeFormVm);
        yield EditUsingFormOtherSportsLoadedState(resultObject: data);
      } catch (e) {
        print('error in edit using form other sports loaded state' +
            e.toString());
        yield EditUsingFormOtherSportsErrorSatte(message: e.toString());
      }
    }
  }
}
