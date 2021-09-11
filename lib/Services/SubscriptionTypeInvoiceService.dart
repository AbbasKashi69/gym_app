import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/SubscriptionTypeInvoice/Page_SubscriptionTypeInvoiceVm.dart';

class SubscriptionTypeService {
  BaseRepository? repository;
  SubscriptionTypeService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/SubscriptionTypeInvoice/GetAll';

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
}
