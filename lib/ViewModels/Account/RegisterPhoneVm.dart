import 'package:gym_app/ViewModels/BaseViewModel.dart';

class RegisterPhoneVm extends BaseViewModel {
  String? userName;

  RegisterPhoneVm({this.userName});

  RegisterPhoneVm.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    return data;
  }
}
