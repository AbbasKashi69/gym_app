import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/DietPlanTypeLog/Page_DietPlanTypeLogVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class DietPlanTypeLogService extends BaseViewModel {
  BaseRepository? repository;
  DietPlanTypeLogService() {
    repository = BaseRepository();
  }

  static const String url_getAll = 'api/DietPlanTypeLog/GetAll';
  static const String url_getPlansBySort = 'api/DietPlanTypeLog/GetPlansBySort';
  static const String url_payPlanUsingWallet =
      '/api/DietPlanTypeLog/PayPlanUsingWallet';
  static const String url_changeCurrentDay =
      '/api/DietPlanTypeLog/ChangeCurrentDay';

  Future<Page_DietPlanTypeLogVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_DietPlanTypeLogVm result = Page_DietPlanTypeLogVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_DietPlanTypeLogVm?> getPlansBySort(
      int coachId, int studentId, String planStatusList, String searchText,
      [int pageNumber = 1]) async {
    var response = await repository!.get(url_getPlansBySort +
        '?coachId=$coachId&studentId=$studentId&planStatusList=$planStatusList&pageNumber=$pageNumber&searchText=$searchText');
    if (response != null) {
      Page_DietPlanTypeLogVm result = Page_DietPlanTypeLogVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> payPlanUsingWallet(int planLogId) async {
    var response = await repository!
        .post(url_payPlanUsingWallet + '?planLogId=$planLogId', {});
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> changeCurrentDay(int planId, int? addedDay) async {
    var response = await repository!
        .post(url_changeCurrentDay + '?planId=$planId&addedDay=$addedDay', {});
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
