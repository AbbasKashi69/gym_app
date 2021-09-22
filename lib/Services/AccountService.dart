import 'package:gym_app/Repositories/BaseRepository.dart';
import 'package:gym_app/ViewModels/Account/ConfirmCodeVm.dart';
import 'package:gym_app/ViewModels/Account/ForgetPasswordVm.dart';
import 'package:gym_app/ViewModels/Account/LoginVm.dart';
import 'package:gym_app/ViewModels/Account/RegisterVm.dart';
import 'package:gym_app/ViewModels/Account/RoleVm.dart';
import 'package:gym_app/ViewModels/Account/SendCodeVm.dart';
import 'package:gym_app/ViewModels/Account/SetPasswordVm.dart';
import 'package:gym_app/ViewModels/ResultObject.dart';

class AccountService {
  BaseRepository? repository;
  AccountService() {
    repository = BaseRepository();
  }
  static const String url_login = '/api/Account/Login';
  static const String url_register = '/api/Account/Register';
  static const String url_submitRegister = '/api/Account/submitRegister';
  static const String url_getCurrentUserRole =
      '/api/Account/GetCurrentUserRole';
  static const String url_changePassword = '/api/Account/ChangePassword';
  static const String url_sendCode = '/api/Account/SendCode';
  static const String url_verifyCode = '/api/Account/VerifyCode';
  static const String url_restPassword = '/api/Account/RestPassword';
  static const String url_verifyCodeRestPassword =
      '/api/Account/VerifyCodeResetPassword';
  static const String url_sendCodeResetPassword =
      'api/Account/SendCodeResetPassword';
  static const String url_selectProvider = '/api/Account/SelectProvider';

  Future<ResultObject> login(LoginVm loginVm) async {
    var response = await repository!.post(url_login, loginVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    var result = ResultObject(false, "عملیات ورود با شکست مواجه شد.");
    return result;
  }

  Future<ResultObject?> register(String userName) async {
    var response = await repository!.post(url_register, {"userName": userName});
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> submitRegister(RegisterVm registerVm) async {
    var response =
        await repository!.post(url_submitRegister, registerVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<List<RoleVm>?> getCurrentUserRole(int? userId) async {
    var response =
        await repository!.getAll(url_getCurrentUserRole + '?userId=$userId');
    if (response != null) {
      var result = response.map((e) => RoleVm.fromJson(e)).toList();
      return result;
    }
    return null;
  }

  Future<ResultObject?> changePassword(SetPasswordVm setPasswordVm) async {
    var response =
        await repository!.post(url_changePassword, setPasswordVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> sendCode(SendCodeVm sendCodeVm) async {
    var response = await repository!.post(url_sendCode, sendCodeVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> verifyCode(ConfirmCodeVm confirmCodeVm) async {
    var response =
        await repository!.post(url_verifyCode, confirmCodeVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> restPassword(ForgetPasswordVm forgetPasswordVm) async {
    var response =
        await repository!.post(url_restPassword, forgetPasswordVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> verifyCodeRestPassword(
      ConfirmCodeVm confirmCodeVm) async {
    var response = await repository!
        .post(url_verifyCodeRestPassword, confirmCodeVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> sendCodeResetPassword(
      ForgetPasswordVm forgetPassowrdVm) async {
    var response = await repository!
        .post(url_sendCodeResetPassword, forgetPassowrdVm.toJson());
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }

  Future<ResultObject?> selectProvider(String userName) async {
    var response =
        await repository!.post(url_selectProvider + '?userName=$userName', {});
    if (response != null) {
      ResultObject result = ResultObject.fromJson(response);
      return result;
    }
    return null;
  }
}
