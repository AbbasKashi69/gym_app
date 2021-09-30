import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';
import 'package:gym_app/ViewModels/Person/PersonVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonService {
  BaseRepository? repository;

  PersonService() {
    repository = BaseRepository();
  }

  static const String url_findById = '/api/Person/FindById';
  static const String url_getAll = '/api/Person/GetAllCoaches';
  static const String url_edit = '/api/Person/Edit';
  static const String url_getMyMiniProfile = '/api/Person/GetMyMiniProfile';
  static const String url_findPersonById = '/api/Person/FindPersonById';

  Future<List<PersonListVm>?> getAllCoaches([int pageNumber = 1]) async {
    var response =
        await repository!.getAll(url_getAll + '?pageNumber=$pageNumber');
    if (response != null) {
      List<PersonListVm> result =
          response.map((e) => PersonListVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }

  Future<PersonListVm?> getMyMiniProfile() async {
    var response = await repository!.get(url_getMyMiniProfile);
    if (response != null) {
      PersonListVm result = PersonListVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> edit(PersonVm vm) async {
    var headers = {
      'Authorization': 'Bearer ${CurrentUserVm.token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    var uri = Uri.parse(BaseRepository.baseUrl + url_edit);
    var request = new http.MultipartRequest("Put", uri);

    if (vm.fileVm != null && vm.fileVm!.pickFiles.length > 0) {
      var stream = new http.ByteStream.fromBytes(vm.fileVm!.pickFiles);
      var multiPartFileSign = new http.MultipartFile(
          "picFile", stream, vm.fileVm!.pickFiles.length,
          filename: vm.fileVm!.fileName.split('/').last
          // filename: vm.fileVm.fileName.split('-').last + '.jpg'// this code is useful for pwa
          );
      request.files.add(multiPartFileSign);
    }
    request.headers.addAll(headers);
    request.fields['id'] = vm.id.toString();
    request.fields['email'] = 'salam khoub'; //vm.email!;
    request.fields['firstName'] = vm.firstName!;
    request.fields['lastName'] = vm.lastName!;
    // request.fields['birthDate'] = vm.birthDate!;
    request.fields['nBirthDate'] = '09-08-1400'; //vm.nBirthDate!
    request.fields['nationalCode'] = vm.nationalCode!;
    // request.fields['postalCode'] = vm.postalCode!;
    // request.fields['registeryDate'] = vm.registeryDate!;
    request.fields['telphone'] = vm.telphone!;
    request.fields['genderType'] = vm.genderType!.toString();
    // request.fields['nGenderType'] = vm.nGenderType!;

    var response = await request.send();

    if (response.statusCode == 200) {
      var result = await response.stream.bytesToString();
      var res = ResultObject.fromJson(jsonDecode(result));
      return res;
    }
    return ResultObject(false, 'error');
  }

  Future<PersonVm?> findById(int id) async {
    var response = await repository!.get(url_findById + '?id=$id');
    if (response != null) {
      PersonVm result = PersonVm.fromJson(response);
      return result;
    }
    return null;
  }

  Future<PersonVm?> findPersonById() async {
    var response = await repository!.get(url_findPersonById);
    if (response != null) {
      PersonVm result = PersonVm.fromJson(response);
      return result;
    }
    return null;
  }
}
