import 'package:bloc/bloc.dart';
import 'package:gym_app/Services/PersonService.dart';
import 'package:gym_app/ViewModels/Person/PersonVm.dart';
import 'package:meta/meta.dart';

part 'find_person_by_id_event.dart';
part 'find_person_by_id_state.dart';

class FindPersonByIdBloc
    extends Bloc<FindPersonByIdEvent, FindPersonByIdState> {
  FindPersonByIdBloc() : super(FindPersonByIdInitialState());
  PersonService _personService = PersonService();

  @override
  Stream<FindPersonByIdState> mapEventToState(
      FindPersonByIdEvent event) async* {
    if (event is FindPersonByIdLoadingEvent) {
      yield FindPersonByIdLoadingState();
      try {
        var data = await _personService.findPersonById();
        yield FindPersonByIdLoadedState(personVm: data);
      } catch (e) {
        print('error in find person by id loaded state ' + e.toString());
        yield FindPersonByIdErrorSatte(message: e.toString());
      }
    }
  }
}
