import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanTypeLog/Page_BodyBuildingPlanTypeLogVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class BodyBuildingPlanTypeLogService {
  BaseRepository? repository;
  BodyBuildingPlanTypeLogService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/BodyBuildingPlanTypeLog/GetAll';
  static const String url_getPlansBySort =
      '/api/BodyBuildingPlanTypeLog/GetPlansBySort';
  static const String url_payPlanUsingWallet =
      '/api/BodyBuildingPlanTypeLog/PayPlanUsingWallet';
  Future<Page_BodyBuildingPlanTypeLogVm?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.get(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      Page_BodyBuildingPlanTypeLogVm result =
          Page_BodyBuildingPlanTypeLogVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_BodyBuildingPlanTypeLogVm?> getPlansBySortint(
      int coachId, int studentId, String planStatusList, String searchText,
      [int pageNumber = 1]) async {
    var response = await repository!.get(url_getPlansBySort +
        '?coachId=$coachId&studentId=$studentId&planStatusList=$planStatusList&pageNumber=$pageNumber&searchText=$searchText');
    if (response != null) {
      Page_BodyBuildingPlanTypeLogVm result =
          Page_BodyBuildingPlanTypeLogVm.fromJson(response);
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
}
