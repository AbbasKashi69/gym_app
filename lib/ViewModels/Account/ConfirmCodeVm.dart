import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ConfirmCodeVm extends BaseViewModel {
  String? code;
  String? userId;
  String? userName;
  String? typeSelect;

  ConfirmCodeVm({this.code, this.userId, this.userName, this.typeSelect});

  ConfirmCodeVm.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    userId = json['userId'];
    userName = json['userName'];
    typeSelect = json['typeSelect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['typeSelect'] = this.typeSelect;
    return data;
  }
}
