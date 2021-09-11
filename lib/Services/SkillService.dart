import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResturantFood/Page_ResturantFoodVm.dart';
import 'package:gym_app/ViewModels/ResturantFood/ResturantFoodVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/Skill/Page_SkillVm.dart';
import 'package:gym_app/ViewModels/Skill/SkillVm.dart';

class SkillService {
  BaseRepository? repository;
  SkillService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/Skill/GetAll';
  static const String url_create = '/api/Skill/Create';
  static const String url_edit = '/api/Skill/Edit';
  static const String url_delete = '/api/Skill/Delete';

  Future<Page_SkillVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_SkillVm result = Page_SkillVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(SkillVm skillVm) async {
    var response = await repository!.edit(url_edit, skillVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(SkillVm skillVm) async {
    var response = await repository!.post(url_create, skillVm.toJson());
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
