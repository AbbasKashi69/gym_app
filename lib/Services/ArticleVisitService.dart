import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ArticleVisit/ArticleVisitVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class ArticleVisitService {
  BaseRepository? repository;
  ArticleVisitService() {
    repository = BaseRepository();
  }

  static const String url_create = '/api/ArticleVisit/Create';
  Future<ResultObject?> create(ArticleVisitVm articleVisitVm) async {
    var response = await repository!.post(url_create, articleVisitVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
