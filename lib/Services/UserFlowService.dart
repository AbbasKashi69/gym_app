import 'dart:convert';

import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:gym_app/ViewModels/UserFlow/UserFlowVm.dart';
import 'package:gym_app/ViewModels/UserFlow/userFlowChartVm.dart';
import 'package:http/http.dart' as http;

class UserFlowService {
  BaseRepository? repository;
  UserFlowService() {
    repository = BaseRepository();
  }
  static const String url_findById = '/api/UserFlow/FindById';

  static const String url_create = '/api/UserFlow/Create';
  static const String url_edit = '/api/UserFlow/Edit';
  static const String url_delete = '/api/UserFlow/Delete';
  static const String url_getUserFlowByDate = '/api/UserFlow/GetUserFlowByDate';
  static const String url_getUserFlowChartInformation =
      '/api/UserFlow/GetUserFlowChartInformation';

  Future<UserFlowVm?> findById(int id) async {
    var response = await repository!.get(url_findById + '?id=$id');
    if (response != null) {
      UserFlowVm result = UserFlowVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(UserFlowVm userFlowVm) async {
    var response = await repository!.edit(url_edit, userFlowVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> create(UserFlowVm vm) async {
    var headers = {
      'Authorization': 'Bearer ${CurrentUserVm.token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var uri = Uri.parse(BaseRepository.baseUrl + url_create);
    var request = new http.MultipartRequest("Post", uri);
    List<http.MultipartFile> multiPartFileList = [];
    if (vm.listFileVm != null && vm.listFileVm!.isNotEmpty) {
      int i = 0;
      vm.listFileVm!.forEach((element) {
        if (element.pickFiles.length > 0) {
          var stream = new http.ByteStream.fromBytes(element.pickFiles);
          var multiPartFileSign = new http.MultipartFile(
              "userFlowFiles[$i]", stream, element.pickFiles.length,
              filename: element.fileName.split('/').last
              // filename: vm.fileVm.fileName.split('-').last + '.jpg'// this code is useful for pwa
              );
          multiPartFileList.add(multiPartFileSign);
          i += 1;
        }
      });

      request.files.addAll(multiPartFileList);
    }
    request.headers.addAll(headers);
    request.fields['id'] = vm.id.toString();
    request.fields['userId'] = vm.userId.toString();
    request.fields['coachId'] = vm.coachId.toString();
    request.fields['weight'] = vm.weight.toString();
    request.fields['height'] = vm.height.toString();
    request.fields['trainingTime'] = vm.trainingTime.toString();
    request.fields['dietPlanFollowPercent'] =
        vm.dietPlanFollowPercent.toString();
    request.fields['bodyBuildingPlanFollowPercent'] =
        vm.bodyBuildingPlanFollowPercent.toString();
    request.fields['anonymousPlanFollowPercent'] =
        vm.anonymousPlanFollowPercent.toString();
    request.fields['title'] = vm.title ?? "";
    request.fields['description'] = vm.description;
    request.fields['nCreationDate'] = vm.nCreationDate;

    var response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var res = ResultObject.fromJson(jsonDecode(result));
      return res;
    }
    return ResultObject(false, 'دوباره امتحان کنید');
  }

  Future<ResultObject?> delete(int id) async {
    var response = await repository!.delete(url_delete, id);
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> getUserFlowByDate(
      int? userId, int? coachId, String date) async {
    var response = await repository!.get(
        url_getUserFlowByDate + '?userId=$userId&coachId=$coachId&date=$date');
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<List<UserFlowChartVm>?> getUserFlowChartInformation(
      int? userId, int? coachId) async {
    var response = await repository!.getAll(
        url_getUserFlowChartInformation + '?userId=$userId&coachId=$coachId');
    if (response != null) {
      List<UserFlowChartVm> result =
          response.map((e) => UserFlowChartVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }
}
