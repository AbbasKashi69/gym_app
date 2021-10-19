import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/AnonymousPlanTypeLog/Page_AnonymousPlanTypeLog.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class AnonymousPlanTypeLogService {
  BaseRepository? repository;
  AnonymousPlanTypeLogService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/AnonymousPlanTypeLog/GetAll';
  static const String url_getPlanBySort =
      '/api/AnonymousPlanTypeLog/GetPlansBySort';
  static const String url_payPlanUsingWallet =
      '/api/AnonymousPlanTypeLog/PayPlanUsingWallet';
  static const String url_changeCurrentDay =
      '/api/AnonymousPlanTypeLog/ChangeCurrentDay';

  Future<Page_AnonymousPlanTypeLogVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_AnonymousPlanTypeLogVm result =
          Page_AnonymousPlanTypeLogVm.fromJson(response);
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

  Future<Page_AnonymousPlanTypeLogVm?> getPlansBySort(
      int coachId, int studentId, String planStatusList, String searchText,
      [int pageNumber = 1]) async {
    var response = await repository!.get(url_getPlanBySort +
        '?coachId=$coachId&studentId=$studentId&planStatusList=$planStatusList&pageNumber=$pageNumber&searchText=$searchText');
    if (response != null) {
      Page_AnonymousPlanTypeLogVm result =
          Page_AnonymousPlanTypeLogVm.fromJson(response);
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
