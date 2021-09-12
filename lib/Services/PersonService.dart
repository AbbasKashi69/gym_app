import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:gym_app/ViewModels/Person/PersonVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class PersonService {
  BaseRepository? repository;

  PersonService() {
    repository = BaseRepository();
  }

  static const String url_findById = '/api/Person/FindById';
  static const String url_getAll = '/api/Person/GetAllCoaches';
  static const String url_edit = '/api/Person/Edit';
  static const String url_getMyMiniProfile = '/api/Person/GetMyMiniProfile';

  Future<List<PersonListVm>?> getAllCoaches([int pageNumber = 1]) async {
    var response =
        await repository!.getAll(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      List<PersonListVm> result =
          response.map((e) => PersonListVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }

  Future<PersonListVm?> getMyMiniProfile() async {
    var response = await repository!.get(url_getMyMiniProfile);
    if (response != null) {
      PersonListVm result = PersonListVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(PersonVm personVm) async {
    var response = await repository!.edit(url_edit, personVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<PersonVm?> findById(int id) async {
    var response = await repository!.get(url_findById + '?id=$id');
    if (response != null) {
      PersonVm result = PersonVm.fromJson(response);
      return result;
    }
    return null;
  }
}
