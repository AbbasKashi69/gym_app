import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ForgotPasswordVm extends BaseViewModel {
  String? mobile;
  String? password;
  String? confirmPassword;
  String? token;

  ForgotPasswordVm(
      {this.mobile, this.password, this.confirmPassword, this.token});

  ForgotPasswordVm.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['token'] = this.token;
    return data;
  }
}
