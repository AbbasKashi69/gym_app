import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:gym_app/ViewModels/CoachStudent/Page_CoachStudentVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class CoachStudentService extends BaseViewModel {
  BaseRepository? repository;
  CoachStudentService() {
    repository = BaseRepository();
  }

  static const String url_create = '/api/CoachStudent​/Create';
  static const String url_delete = '/api/CoachStudent​/Delete';
  static const String url_getCoachStudents =
      '/api/CoachStudent/GetCoachStudents';
  static const String url_loadCoachStudent =
      '​/api​/CoachStudent​/LoadCoachStudent';
  static const String url_getStudentsAsPersonList =
      '/api/CoachStudent/GetStudentsAsPersonList';
  static const String url_changeStatus = '/api/CoachStudent/ChangeStatus';
  static const String url_getStudentCoaches =
      '/api/CoachStudent/GetStudentCoaches';
  static const String url_requestTocoach = '/api/CoachStudent/RequestToCoach';

  Future<ResultObject?> create(CoachStudentVm coachStudentVm) async {
    var response = await repository!.post(url_create, coachStudentVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> changeStatus(
      int? coachStudentId, bool? isAccepted) async {
    var response = await repository!.post(
        url_changeStatus +
            '?coachStudentId=$coachStudentId&isAccepted=$isAccepted',
        {});
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> requestToCoach(int? coachId) async {
    var response =
        await repository!.post(url_requestTocoach + '?coachId=$coachId', {});
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

  Future<Page_CoachStudentVm?> loadCoachStudent(
      int studentId, int coachId, int status,
      [int pageNumber = 1]) async {
    var response = await repository!.get(url_loadCoachStudent +
        '?studentId=$studentId&coachId=$coachId&status=$status&pageNumber=$pageNumber');
    if (response != null) {
      Page_CoachStudentVm result = Page_CoachStudentVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<Page_CoachStudentVm?> getCoachStudents(int? coachId,
      [int pageNumber = 1, String statusString = '1']) async {
    var response = await repository!.get(url_getCoachStudents +
        "?coachId=$coachId&statusString=$statusString&pageNumber=$pageNumber");
    if (response != null) {
      Page_CoachStudentVm result = Page_CoachStudentVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<List<CoachStudentVm>?> getStudentCoaches() async {
    var response = await repository!.getAll(url_getStudentCoaches);
    if (response != null) {
      List<CoachStudentVm> result =
          response.map((e) => CoachStudentVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }

  Future<List<PersonListVm>?> getStudentsAsPersonList(
      int? coachId, String? searchText) async {
    var response = await repository!.getAll(url_getStudentsAsPersonList +
        '?coachId=$coachId&searchText=$searchText');
    if (response != null) {
      List<PersonListVm> result =
          response.map((e) => PersonListVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }
}
