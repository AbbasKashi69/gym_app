import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BankCard/BankCardVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class BankCardService {
  BaseRepository? repository;
  BankCardService() {
    repository = BaseRepository();
  }
  static const String url_create = '/api/BankCard/Create';
  static const String url_edit = '/api/BankCard/Edit';
  static const String url_delete = '/api/BankCard/Delete';

  Future<ResultObject?> edit(BankCardVm bankCardVm) async {
    var response = await repository!.edit(url_edit, bankCardVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(BankCardVm bankCardVm) async {
    var response = await repository!.post(url_create, bankCardVm.toJson());
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
