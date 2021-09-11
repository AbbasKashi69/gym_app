import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResturantFood/Page_ResturantFoodVm.dart';
import 'package:gym_app/ViewModels/ResturantFood/ResturantFoodVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class ResturantFoodService {
  BaseRepository? repository;
  ResturantFoodService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/ResturantFood/GetAll';
  static const String url_create = '/api/ResturantFood/Create';
  static const String url_edit = '/api/ResturantFood/Edit';
  static const String url_delete = '/api/ResturantFood/Delete';

  Future<Page_ResturantFoodVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_ResturantFoodVm result = Page_ResturantFoodVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(ResturantFoodVm resturantFoodVm) async {
    var response = await repository!.edit(url_edit, resturantFoodVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(ResturantFoodVm resturantFoodVm) async {
    var response = await repository!.post(url_create, resturantFoodVm.toJson());
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
