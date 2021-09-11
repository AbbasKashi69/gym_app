import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResturantFood/Page_ResturantFoodVm.dart';
import 'package:gym_app/ViewModels/ResturantMainMenu/Page_ResturantMainMenuVm.dart';
import 'package:gym_app/ViewModels/ResturantMainMenu/ResturantMainMenuVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class ResturantMainMenuService {
  BaseRepository? repository;
  ResturantMainMenuService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/ResturantMainMenu/GetAll';
  static const String url_create = '/api/ResturantMainMenu/Create';
  static const String url_delete = '/api/ResturantMainMenu/Delete';

  Future<Page_ResturantMainMenuVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_ResturantMainMenuVm result =
          Page_ResturantMainMenuVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(ResturantMainMenuVm resturantMainMenuVm) async {
    var response =
        await repository!.post(url_create, resturantMainMenuVm.toJson());
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
