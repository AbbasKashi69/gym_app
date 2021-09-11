import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/SubscriptionType/SubscriptionTypeVm.dart';
import 'package:gym_app/ViewModels/Transaction/Page_TransactionVm.dart';

class TransactionService {
  BaseRepository? repository;
  TransactionService() {
    repository = BaseRepository();
  }
  static const String url_edit = '/api/Transaction/Edit';
  static const String url_loadTransaction = '/api/Transaction/LoadTransaction';
  static const String url_getAll = '/api/Transaction/GetAll';

  Future<ResultObject?> edit(SubscriptionTypeVm subscriptionTypeVm) async {
    var response =
        await repository!.edit(url_edit, subscriptionTypeVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_TransactionVm?> loadTransaction(
      String bankName, String trackingCode,
      [int pageNumber = 1]) async {
    var response = await repository!.get(url_loadTransaction +
        '?bankName=$bankName&trackingCode=$trackingCode&pageNumber=$pageNumber');
    if (response != null) {
      Page_TransactionVm result = Page_TransactionVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_TransactionVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_TransactionVm result = Page_TransactionVm.fromJson(response);
      return result;
    }
    return null;
  }
}
