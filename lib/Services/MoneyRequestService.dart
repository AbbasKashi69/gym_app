import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/MoneyRequest/MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class MoneyRequestService {
  BaseRepository? repository;

  MoneyRequestService() {
    repository = BaseRepository();
  }

  static const String url_getAll = '/api/MoneyRequest/GetAll';
  static const String url_findById = '/api/MoneyRequest/FindById';
  static const String url_create = '/api/MoneyRequest/Create';

  Future<ResultObject?> create(MoneyRequestVm moneyRequestVm) async {
    var response = await repository!.post(url_create, moneyRequestVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<List<MoneyRequestVm>?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.getAll(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      List<MoneyRequestVm> result =
          response.map((e) => MoneyRequestVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }

  Future<MoneyRequestVm?> findById(int id) async {
    var response = await repository!.get(url_findById + '?id=$id');
    if (response != null) {
      MoneyRequestVm result = MoneyRequestVm.fromJson(response);
      return result;
    }
    return null;
  }
}
