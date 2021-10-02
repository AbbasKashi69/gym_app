import 'package:gym_app/ViewModels/BaseViewModel.dart';

class SetPasswordVm extends BaseViewModel {
  String? userName;
  int? userId;
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  SetPasswordVm(
      {this.userName,
      this.userId = 0,
      this.oldPassword,
      this.newPassword,
      this.confirmPassword});

  SetPasswordVm.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userId = json['userId'];
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
    confirmPassword = json['confirmPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    data['oldPassword'] = this.oldPassword;
    data['newPassword'] = this.newPassword;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
