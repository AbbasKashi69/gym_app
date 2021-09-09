import 'package:gym_app/ViewModels/BaseViewModel.dart';

class LoginVm extends BaseViewModel {
  String? userName;
  String? password;

  LoginVm({this.userName, this.password});

  LoginVm.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['password'] = this.password;
    return data;
  }
}
