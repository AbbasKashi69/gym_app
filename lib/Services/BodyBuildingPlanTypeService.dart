import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanType/BodyBuildingPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class BodyBuildingPlanTypeService {
  BaseRepository? repository;
  BodyBuildingPlanTypeService() {
    repository = BaseRepository();
  }

  static const String url_createUsingForm =
      '/api/BodyBuildingPlanType/CreateUsingForm';
  static const String url_editUsingForm =
      '/api/BodyBuildingPlanType/EditUsingForm';
  static const String url_delte = '/api/BodyBuildingPlanType/Delete';
  static const String url_findByIdInForm =
      '/api/BodyBuildingPlanType/FindByIdInForm';

  Future<ResultObject?> createUsingForm(
      BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm) async {
    var response = await repository!
        .post(url_createUsingForm, bodyBuildingPlanTypeFormVm.toJson());
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
      //var anynymous= BodyBuildingPlanTypeFormVm.fromJson(response['extra']);
      return result;
    }
    return null;
  }

  Future<ResultObject?> editUsingForm(
      BodyBuildingPlanTypeFormVm bodyBuildingPlanTypeFormVm) async {
    var response = await repository!
        .edit(url_editUsingForm, bodyBuildingPlanTypeFormVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> delete(int id) async {
    var response = await repository!.delete(url_delte, id);
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
