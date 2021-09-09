import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ArticleCategory/ArticleCategoryVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class ArticleCategoryService {
  BaseRepository? repository;
  ArticleCategoryService() {
    repository = BaseRepository();
  }
  static const String url_getAllCategories =
      '/api/ArticleCategory/GetAllCategories';
  static const String url_create = '/api/ArticleCategory/Create';
  static const String url_edit = '/api/ArticleCategory/Edit';
  static const String url_delete = '/api/ArticleCategory/Delete';

  Future<List<ArticleCategoryVm>?> getAllCategories(int parentId,
      [int pageNumber = 1]) async {
    var response = await repository!.getAll(
        url_getAllCategories + '?parentId=$parentId&pageNumber=$pageNumber');
    if (response != null) {
      List<ArticleCategoryVm> result =
          response.map((e) => ArticleCategoryVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(ArticleCategoryVm articleCategoryVm) async {
    var response = await repository!.edit(url_edit, articleCategoryVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(ArticleCategoryVm articleCategoryVm) async {
    var response =
        await repository!.post(url_create, articleCategoryVm.toJson());
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
