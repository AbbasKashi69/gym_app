import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BodyBuildingMovement/BodyBuildingMovementVm.dart';

class BodyBuildingMovementService {
  BaseRepository? repository;
  BodyBuildingMovementService() {
    repository = BaseRepository();
  }
  static const String url_getUserBodyBuildingMovementList =
      '/api/BodyBuildingMovement/GetUserBodyBuildingMovementList';

  Future<List<BodyBuildingMovementVm>?> getUserBodyBuildingMovementList(
      [String? searchText = "", bool includeOffered = true]) async {
    var response = await repository!.getAll(
        url_getUserBodyBuildingMovementList +
            '?searchText=$searchText&includeOffered=$includeOffered');
    if (response != null) {
      List<BodyBuildingMovementVm> result =
          response.map((e) => BodyBuildingMovementVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }
}
