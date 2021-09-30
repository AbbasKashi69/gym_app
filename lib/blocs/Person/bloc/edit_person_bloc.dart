import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/PersonService.dart';
import 'package:gym_app/ViewModels/Person/PersonVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:meta/meta.dart';

part 'edit_person_event.dart';
part 'edit_person_state.dart';

class EditPersonBloc extends Bloc<EditPersonEvent, EditPersonState> {
  EditPersonBloc() : super(EditPersonInitialState());
  PersonService _personService = PersonService();
  @override
  Stream<EditPersonState> mapEventToState(EditPersonEvent event) async* {
    if (event is EditPersonLoadingEvent) {
      yield EditPersonLoadingState();
      try {
        var data = await _personService.edit(event.personVm);
        yield EditPersonLoadedState(resultObject: data);
      } catch (e) {
        print('error in edit person loaddd state ' + e.toString());
        yield EditPersonErrorSatte(message: e.toString());
      }
    }
  }
}
