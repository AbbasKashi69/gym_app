import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BodyBuildingMovement/BodyBuildingMovementVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class BodyBuildingMovementService {
  BaseRepository? repository;
  BodyBuildingMovementService() {
    repository = BaseRepository();
  }
  static const String url_getUserBodyBuildingMovementList =
      '/api/BodyBuildingMovement/GetUserBodyBuildingMovementList';

  static const String url_create =
      '/api/BodyBuildingMovement/Create';

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


  Future<ResultObject?> create(BodyBuildingMovementVm bodyBuildingMovementVm) async {
    print("aaa11");
    var response = await repository!.post(url_create, bodyBuildingMovementVm.toJson());
    print("aaa113");
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      print(response);
      print("aaa12");
      return result;
    }
    print(response);
    return null;
  }

}
