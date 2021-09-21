import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/SubscriptionTypeInvoice/Page_SubscriptionTypeInvoiceListVm.dart';
import 'package:gym_app/ViewModels/SubscriptionTypeInvoice/Page_SubscriptionTypeInvoiceVm.dart';

class SubscriptionTypeInvoiceService {
  BaseRepository? repository;
  SubscriptionTypeInvoiceService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/SubscriptionTypeInvoice/GetAll';
  static const String url_getUserSubscriptionHistory = '/api/SubscriptionType/GetUserSubscriptionHistory';

  Future<Page_SubscriptionTypeInvoiceVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_SubscriptionTypeInvoiceVm result =
          Page_SubscriptionTypeInvoiceVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_SubscriptionTypeInvoiceListVm?> getUserSubscriptionHistory([int pageNumber = 1]) async {
    var response =
    await repository!.get(url_getUserSubscriptionHistory + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_SubscriptionTypeInvoiceListVm result =
      Page_SubscriptionTypeInvoiceListVm.fromJson(response);
      return result;
    }
    return null;
  }
}
