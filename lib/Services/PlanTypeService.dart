import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/PlanTypeLog/Page_PlanTypeLogVm.dart';

class PlanTypeService extends BaseViewModel {
  BaseRepository? repository;
  PlanTypeService() {
    repository = BaseRepository();
  }
  static const String url_getPlansBySort = 'api/TypePlan/GetPlansBySort';

  Future<Page_PlanTypeLogVm?> getPlansBySort(
      int coachId,
      int studentId,
      int planType,
      String planStatusList,
      String searchText,
      bool setCoachId,
      bool setStudentId,
      [int pageNumber = 1]) async {
    var response = await repository!.get(url_getPlansBySort +
        '?coachId=$coachId&studentId=$studentId&planStatusList=$planStatusList&pageNumber=$pageNumber&searchText=$searchText&planType=$planType&setCoachId=$setCoachId&setStudentId=$setStudentId');
    if (response != null) {
      Page_PlanTypeLogVm result = Page_PlanTypeLogVm.fromJson(response);
      return result;
    }
    return null;
  }
}
