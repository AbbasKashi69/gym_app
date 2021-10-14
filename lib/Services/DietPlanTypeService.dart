import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class DietPlanTypeService {
  BaseRepository? repository;
  DietPlanTypeService() {
    repository = BaseRepository();
  }

  static const String url_createUsingForm = '/api/DietPlanType/CreateUsingForm';
  static const String url_findByIdInForm = '/api/DietPlanType/FindByIdInForm';
  static const String url_editUsingForm = 'api/DietPlanType/EditUsingForm';
  Future<ResultObject?> createUsingForm(
      DietPlanTypeFormVm dietPlanTypeFormVm) async {
    var response = await repository!
        .post(url_createUsingForm, dietPlanTypeFormVm.toJson());
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
      return result;
    }
    return null;
  }

  Future<ResultObject?> editUsingForm(
      DietPlanTypeFormVm dietPlanTypeFormVm) async {
    var response =
        await repository!.edit(url_editUsingForm, dietPlanTypeFormVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
