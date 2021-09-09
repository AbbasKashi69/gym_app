import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ArticleRate/ArticleRateVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class ArticleRateService {
  BaseRepository? repository;
  ArticleRateService() {
    repository = BaseRepository();
  }

  static const String url_create = '/api/ArticleRate/Create';
  Future<ResultObject?> create(ArticleRateVm articleRateVm) async {
    var response = await repository!.post(url_create, articleRateVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
