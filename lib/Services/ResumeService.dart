import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/Resume/ResumeVm.dart';

class ResumeService {
  BaseRepository? repository;
  ResumeService() {
    repository = BaseRepository();
  }

  static const String url_getResumeByCoachId = '/api/Resume/GetResumeByCoachId';
  static const String url_create = '/api/Resume/Create';
  static const String url_edit = '/api/Resume/Edit';
  static const String url_findById = '/api/Resume/FindById';
  static const String url_delete = '/api/Resume/Delete';

  Future<ResumeVm?> getResumeByCoachId(int coachId) async {
    print("null2");
    var response =
        await repository!.get(url_getResumeByCoachId + '?coachId=$coachId');
    if (response != null) {
      print("nul3l");
      ResumeVm result = ResumeVm.fromJson(response);
      return result;
    }
    print("null");
    return null;
  }

  Future<ResumeVm?> findById(int id) async {
    var response = await repository!.get(url_findById + '?id=$id');
    if (response != null) {
      ResumeVm result = ResumeVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(ResumeVm resumeVm) async {
    var response = await repository!.edit(url_edit, resumeVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(ResumeVm resumeVm) async {
    var response = await repository!.post(url_create, resumeVm.toJson());
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
