import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/MoneyRequest/MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/MoneyRequest/Page_MoneyRequestVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class MoneyRequestService {
  BaseRepository? repository;

  MoneyRequestService() {
    repository = BaseRepository();
  }

  static const String url_getAll = '/api/MoneyRequest/GetAll';
  static const String url_findById = '/api/MoneyRequest/FindById';
  static const String url_create = '/api/MoneyRequest/Create';
  static const String url_getDeposit= '/api/MoneyRequest/GetDeposit';
  static const String url_getWthdraw= '/api/MoneyRequest/GetWthdraw';
  static const String url_getTransferToCardBank= '/api/MoneyRequest/GetTransferToCardBank';

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

  Future<Page_MoneyRequestVm?> getDeposit(int? pageSize, [int pageNumber = 1] ) async {
    var response = await repository!.get(url_getDeposit +
        '?pageNumber=$pageNumber&pageSize=$pageSize');
    if (response != null) {
      Page_MoneyRequestVm result = Page_MoneyRequestVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_MoneyRequestVm?> getWithdrawal(int? pageSize, [int pageNumber = 1] ) async {
    var response = await repository!.get(url_getWthdraw +
        '?pageNumber=$pageNumber&pageSize=$pageSize');
    if (response != null) {
      Page_MoneyRequestVm result = Page_MoneyRequestVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_MoneyRequestVm?> getTransferToCardBank(int? pageSize, [int pageNumber = 1] ) async {
    var response = await repository!.get(url_getTransferToCardBank +
        '?pageNumber=$pageNumber&pageSize=$pageSize');
    if (response != null) {
      Page_MoneyRequestVm result = Page_MoneyRequestVm.fromJson(response);
      return result;
    }
    return null;
  }
}




