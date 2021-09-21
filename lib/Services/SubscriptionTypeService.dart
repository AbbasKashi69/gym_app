import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/SubscriptionType/SubscriptionTypeVm.dart';

class SubscriptionTypeService {
  BaseRepository? repository;
  SubscriptionTypeService() {
    repository = BaseRepository();
  }
  static const String url_getAll = '/api/SubscriptionType/GetAll';
  static const String url_findById = '/api/SubscriptionType/FindById';

  static const String url_create = '/api/SubscriptionType/Create';
  static const String url_edit = '/api/SubscriptionType/Edit';
  static const String url_delete = '/api/SubscriptionType/Delete';
  static const String url_getUserCurrentSubscription = '/api/SubscriptionType/GetUserCurrentSubscription';


  Future<ResultObject?> getUserCurrentSubscription() async {
    var response =
    await repository!.get(url_getUserCurrentSubscription);
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<List<SubscriptionTypeVm>?> getAll([int pageNumber = 1]) async {
    var response =
        await repository!.getAll(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      List<SubscriptionTypeVm> result =
          response.map((e) => SubscriptionTypeVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }

  Future<SubscriptionTypeVm?> findById(int id) async {
    var response = await repository!.get(url_findById + '?id=$id');
    if (response != null) {
      SubscriptionTypeVm result = SubscriptionTypeVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(SubscriptionTypeVm subscriptionTypeVm) async {
    var response =
        await repository!.edit(url_edit, subscriptionTypeVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(SubscriptionTypeVm subscriptionTypeVm) async {
    var response =
        await repository!.post(url_create, subscriptionTypeVm.toJson());
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
