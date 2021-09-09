import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ArticleComment/ArticleCommentVm.dart';
import 'package:gym_app/ViewModels/ArticleComment/page_ArticleCommentVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class ArticleCommentService {
  BaseRepository? repository;
  ArticleCommentService() {
    repository = BaseRepository();
  }
  static const String url_getAllByArticleId =
      '/api/ArticleCommentService/GetAllByArticleId';
  static const String url_create = '/api/ArticleCommentService/Create';
  static const String url_edit = '/api/ArticleCommentService/Edit';
  static const String url_delete = '/api/ArticleCommentService/Delete';

  Future<Page_ArticleCommentVm?> getAllByArticleId(int articleId,
      [int pageNumber = 1]) async {
    var response = await repository!.get(
        url_getAllByArticleId + '?articleId=$articleId&pageNumber=$pageNumber');
    if (response != null) {
      Page_ArticleCommentVm result = Page_ArticleCommentVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(ArticleCommentVm articleCommentVm) async {
    var response = await repository!.edit(url_edit, articleCommentVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(ArticleCommentVm articleCommentVm) async {
    var response =
        await repository!.post(url_create, articleCommentVm.toJson());
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
