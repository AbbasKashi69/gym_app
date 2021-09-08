import 'dart:convert';

import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSavingService {
  SharedPreferences? _sharedPreferences;

  LocalSavingService._();

  static Future<LocalSavingService> create() async {
    var data = LocalSavingService._();
    await data._load();
    return data;
  }

  Future<void> _load() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  setUser(Map jsonVm) {
    //Map jsonVm = jsonDecode(jsonEncode(vm));
    String user = jsonEncode(jsonVm);
    _sharedPreferences!.setString("CurrentUser", user);
  }

  CurrentUserVm? getUser() {
    if (_sharedPreferences!.containsKey('CurrentUser')) {
      String? json = _sharedPreferences!.getString("CurrentUser");
      Map<String, dynamic>? userMap;
      if (json != null) {
        userMap = jsonDecode(json) as Map<String, dynamic>;
      }

      if (userMap != null) {
        final CurrentUserVm user = CurrentUserVm.fromJson(userMap);
        return user;
      }
    }
    return null;

    // var token = TokenResponseVm(userName: "09375183545", phone: "09375183545", token: "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzIiwidW5pcXVlX25hbWUiOiIwOTM3NTE4MzU0NSIsImV4cCI6MTY0NDEyNzc3OCwiaXNzIjoiaHR0cHM6Ly9hcnlhZG9vay5pciIsImF1ZCI6Imh0dHBzOi8vYXJ5YWRvb2suaXIifQ.EeNezei3ePcWnaH8TZQNFt1uvLSx4GjMK2t2xBoDhUlRz6mUVDetgjaLHL6r7q3ekbwdiHSJDn4tDa8gKx1ing");
    // return token;
  }

  void logOff() {
    if (_sharedPreferences!.containsKey('CurrentUser')) {
      _sharedPreferences!.remove('CurrentUser');
    }
  }
}
