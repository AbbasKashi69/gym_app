import 'dart:convert';
import 'package:gym_app/Services/LocalSavingService.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:http/http.dart' as http;

import 'BaseRepository/IBaseRepository.dart';

class BaseRepository implements IBaseRepository {
  static String baseUrl = "https://api.taakgym.ir";
  // static String baseUrl = "http://192.168.1.5:45455";
  // static String baseUrl = "https://192.168.1.4:45456";
  // static String baseUrl = "10.0.2.2";

  Map<String, String>? headersList;
  LocalSavingService? _localSavingService;

  init() async {
    if (CurrentUserVm.token == null) {
      _localSavingService = await LocalSavingService.create();
      var user = _localSavingService!.getUser();
    }

    headersList = {
      'Authorization': 'Bearer ${CurrentUserVm.token}',
      // 'Authorization':
      //     'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMDAyIiwidW5pcXVlX25hbWUiOiIwOTEwMzU3NTA2MiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkNvYWNoIiwiZXhwIjoxNjYyODg0MDkyLCJpc3MiOiJHeW0uY29tIiwiYXVkIjoiR3ltLmNvbSJ9.j8-SCDJjNg93A3uAF3PiH-B_AFF8U2GLtgKtu_i8TWioi61alQsNPCDs6J7xgK1QjeWDuX6dSqdppwzLBstf0A',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Accept': '*/*',
      // 'JobId': '${CurrentUserVm.jobId}'
    };
  }

  BaseRepository() {
    init();

    // headersList = {
    //   //'Authorization': 'Bearer $token',
    //   'Authorization': 'Bearer eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzIiwidW5pcXVlX25hbWUiOiIwOTM3NTE4MzU0NSIsInJvbGUiOiJVc2VyIiwiZXhwIjoxNjQ0MTI5NDYxLCJpc3MiOiJodHRwczovL2FyeWFkb29rLmlyIiwiYXVkIjoiaHR0cHM6Ly9hcnlhZG9vay5pciJ9.r_ycZn3MfmgaRZdaMJVal4HeaFfMHNlRywrgzwvMYRizmfzjeQx_Cpp3gw_n2sA2lRgnlzAaJsx-v2nHQRqZfg',
    //   'Content-Type': 'application/json',
    //   'Accept': 'application/json',
    //   'LngId' : '1',
    //   'JobId' : '1'
    // };
  }

  @override
  Future<List<dynamic>?> getAll(String url) async {
    Uri newUrl = Uri.parse(baseUrl + url);
    http.Response response = await http.get(newUrl, headers: headersList);
    if (response.statusCode == 200) {
      var result = json.decode(response.body) as List<dynamic>;
      return result;
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>> create(
      String url, Map<String, dynamic> jsonVm) async {
    Uri newUrl = Uri.parse(baseUrl + url);
    http.Response response =
        await http.post(newUrl, headers: headersList, body: jsonEncode(jsonVm));

    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var result = json.decode(response.body);
        return result;
      } else {
        var result = {'success': true, 'message': ''};
        return result;
      }
    }
    return {'success': false, 'message': ''};
  }

  @override
  Future<Map<String, dynamic>?> delete(String url, int id) async {
    Uri newUrl = Uri.parse(baseUrl + url + '?id=' + id.toString());
    http.Response response = await http.delete(newUrl, headers: headersList);

    if (response.statusCode == 200 || response.statusCode == 400) {
      if (response.body.isNotEmpty) {
        var result = json.decode(response.body);
        return result;
      } else {
        var result = {'success': true, 'message': ''};
        return result;
      }
    }
    return {'success': false, 'message': ''};
  }

  @override
  Future<Map<String, dynamic>?> edit(
      String url, Map<String, dynamic> jsonVm) async {
    Uri newUrl = Uri.parse(baseUrl + url);
    http.Response response =
        await http.put(newUrl, headers: headersList, body: jsonEncode(jsonVm));

    if (response.statusCode == 200 || response.statusCode == 400) {
      if (response.body.isNotEmpty) {
        var result = json.decode(response.body);
        return result;
      } else {
        var result = {'success': true, 'message': ''};
        return result;
      }
    }
    return {'success': false, 'message': ''};
  }

  @override
  Future<Map<String, dynamic>?> findById(String url, int id) async {
    Uri newUrl = Uri.parse(baseUrl + url + "?id=$id");
    http.Response response = await http.get(newUrl, headers: headersList);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return result;
    }
    return null;
  }

  @override
  Future<Map<String, dynamic>?> get(String url) async {
    Uri newUrl = Uri.parse(baseUrl + url);
    http.Response response = await http.get(newUrl, headers: headersList);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return result;
    }
    return null;
  }

  Future<Map<String, dynamic>?> getByHeader(
      String url, Map<String, String> headers) async {
    Map<String, String> thirdMap = {}..addAll(headersList!)..addAll(headers);
    Uri newUrl = Uri.parse(baseUrl + url);
    http.Response response = await http.get(newUrl, headers: thirdMap);
    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      return result;
    }
    return null;
  }

  Future<Map<String, dynamic>?> post(
      String url, Map<String, dynamic> jsonVm) async {
    Uri newUrl = Uri.parse(baseUrl + url);
    headersList!.addAll(
        {'Content-Type': 'application/json', 'Accept': 'application/json'});
    http.Response response =
        await http.post(newUrl, headers: headersList, body: jsonEncode(jsonVm));
     print(response.statusCode);
     print(response);
    if (response.statusCode == 200 || response.statusCode == 400) {
      if (response.body.isNotEmpty) {
        var result = json.decode(response.body);
        return result;
      } else {
        var result = {'success': true, 'message': 'دوباره امتحان کنید'};
        return result;
      }
    }
    return null;
  }

  Future<Map<String, dynamic>?> postByHeader(String url,
      Map<String, dynamic> jsonVm, Map<String, String> headers) async {
    Uri newUrl = Uri.parse(baseUrl + url);
    headersList!.addAll(
        {'Content-Type': 'application/json', 'Accept': 'application/json'});
    Map<String, String> thirdMap = {}..addAll(headersList!)..addAll(headers);
    http.Response response =
        await http.post(newUrl, headers: thirdMap, body: jsonEncode(jsonVm));

    if (response.statusCode == 200 || response.statusCode == 400) {
      if (response.body.isNotEmpty) {
        var result = json.decode(response.body);
        return result;
      } else {
        var result = {'success': true, 'message': ''};
        return result;
      }
    }
    return null;
  }
}
