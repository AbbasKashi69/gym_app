import 'package:gym_app/ViewModels/BaseViewModel.dart';

class RegisterVm extends BaseViewModel {
  String? username;
  String? mobile;
  String? password;
  String? confirmPassword;
  String? inviteCode;

  RegisterVm(
      {this.username,
      this.mobile,
      this.password,
      this.confirmPassword,
      this.inviteCode});

  RegisterVm.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    mobile = json['mobile'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    inviteCode = json['inviteCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    data['inviteCode'] = this.inviteCode;
    return data;
  }
}
