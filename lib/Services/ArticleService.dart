import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/Article/ArticleVm.dart';
import 'package:gym_app/ViewModels/Article/Page_ArticleVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class ArticleService {
  BaseRepository? repository;
  ArticleService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/Article/GetAll';
  static const String url_getNewest = '/api/Article/GetNewest';
  static const String url_getMostVisited = '/api/Article/GetMostVisited';
  static const String url_getMostRated = '/api/Article/GetMostRated';
  static const String url_findById = '/api/Article/FindById';

  static const String url_create = '/api/Article/Create';
  static const String url_edit = '/api/Article/Edit';
  static const String url_delete = '/api/Article/Delete';

  Future<Page_ArticleVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_ArticleVm result = Page_ArticleVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_ArticleVm?> getNewest(
      [int pageNumber = 1, int count = 5, bool isPaged = false]) async {
    var response = await repository!.get(url_getNewest +
        '?count=$count&pageNumber=$pageNumber&isPaged=$isPaged');
    if (response != null) {
      Page_ArticleVm result = Page_ArticleVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_ArticleVm?> getMostVisited(
      [int pageNumber = 1, int count = 5, bool isPaged = false]) async {
    var response = await repository!.get(url_getMostVisited +
        '?count=$count&pageNumber=$pageNumber&isPaged=$isPaged');
    if (response != null) {
      Page_ArticleVm result = Page_ArticleVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_ArticleVm?> getMostRated(
      [int pageNumber = 1, int count = 5, bool isPaged = false]) async {
    var response = await repository!.get(url_getMostRated +
        '?count=$count&pageNumber=$pageNumber&isPaged=$isPaged');
    if (response != null) {
      Page_ArticleVm result = Page_ArticleVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> findById(int id) async {
    var response = await repository!.get(url_findById + '?id=$id');
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(ArticleVm articleVm) async {
    var response = await repository!.edit(url_edit, articleVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(ArticleVm articleVm) async {
    var response = await repository!.post(url_create, articleVm.toJson());
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
