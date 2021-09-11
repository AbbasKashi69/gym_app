import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/CheckInCheckOut/CheckInCheckOutVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class CheckInCheckOutService extends BaseViewModel {
  BaseRepository? repository;
  CheckInCheckOutService() {
    repository = BaseRepository();
  }

  static const String url_create = '/api/CheckInCheckOut/Create';
  static const String url_delete = '/api/CheckInCheckOut/Delete';

  Future<ResultObject?> create(CheckInCheckOutVm checkInCheckOutVm) async {
    var response =
        await repository!.post(url_create, checkInCheckOutVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> delete(int id) async {
    var response = await repository!.delete(url_delete, id);
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
