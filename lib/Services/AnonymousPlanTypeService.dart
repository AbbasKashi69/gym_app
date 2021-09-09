import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class AnonymousPlanTypeService {
  BaseRepository? repository;
  AnonymousPlanTypeService() {
    repository = BaseRepository();
  }

  static const String url_createUsingForm =
      '/api/AnonymousPlanType/CreateUsingForm';
  static const String url_editUsingForm =
      '/api/AnonymousPlanType/EditUsingForm';
  static const String url_delte = '/api/AnonymousPlanType/Delete';
  static const String url_findByIdInForm =
      'api/AnonymousPlanType/FindByIdInForm';

  Future<ResultObject?> createUsingForm(
      AnonymousPlantypeFormVm anonymousPlantypeFormVm) async {
    var response = await repository!
        .post(url_createUsingForm, anonymousPlantypeFormVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> findByIdInForm(int id) async {
    var response = await repository!.get(url_findByIdInForm + '?id=$id');
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      // response['extra'] is object from AnonymousPlanTypeFormVm
      //var anynymous= AnonymousPlantypeFormVm.fromJson(response['extra']);
      return result;
    }
    return null;
  }

  Future<ResultObject?> editUsingForm(
      AnonymousPlantypeFormVm anonymousPlantypeFormVm) async {
    var response = await repository!
        .edit(url_editUsingForm, anonymousPlantypeFormVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> delete(
      AnonymousPlantypeFormVm anonymousPlantypeFormVm, int id) async {
    var response = await repository!.delete(url_delte, id);
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
