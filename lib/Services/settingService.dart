import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/Setting/SettingVm.dart';

class SettingService {
  BaseRepository? repository;
  SettingService() {
    repository = BaseRepository();
  }
  static const String url_create = '/api/Setting/Create';
  static const String url_edit = '/api/Setting/Edit';
  static const String url_delete = '/api/Setting/Delete';

  Future<ResultObject?> edit(SettingVm settingVm) async {
    var response = await repository!.edit(url_edit, settingVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(SettingVm settingVm) async {
    var response = await repository!.post(url_create, settingVm.toJson());
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
