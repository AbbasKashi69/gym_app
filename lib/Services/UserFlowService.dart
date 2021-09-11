import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/UserFlow/UserFlowVm.dart';

class UserFlowService {
  BaseRepository? repository;
  UserFlowService() {
    repository = BaseRepository();
  }
  static const String url_findById = '/api/UserFlow/FindById';

  static const String url_create = '/api/UserFlow/Create';
  static const String url_edit = '/api/UserFlow/Edit';
  static const String url_delete = '/api/UserFlow/Delete';

  Future<UserFlowVm?> findById(int id) async {
    var response = await repository!.get(url_findById + '?id=$id');
    if (response != null) {
      UserFlowVm result = UserFlowVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(UserFlowVm userFlowVm) async {
    var response = await repository!.edit(url_edit, userFlowVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(UserFlowVm userFlowVm) async {
    var response = await repository!.post(url_create, userFlowVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> delete(int id) async {
    var response = await repository!.delete(url_delete, id);
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
