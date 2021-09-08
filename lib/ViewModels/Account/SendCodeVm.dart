import 'package:gym_app/ViewModels/BaseViewModel.dart';

class SendCodeVm extends BaseViewModel {
  String? selectedProvider;
  String? userId;
  String? returnUrl;
  bool? rememberMe;

  SendCodeVm(
      {this.selectedProvider, this.userId, this.returnUrl, this.rememberMe});

  SendCodeVm.fromJson(Map<String, dynamic> json) {
    selectedProvider = json['selectedProvider'];
    userId = json['userId'];
    returnUrl = json['returnUrl'];
    rememberMe = json['rememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selectedProvider'] = this.selectedProvider;
    data['userId'] = this.userId;
    data['returnUrl'] = this.returnUrl;
    data['rememberMe'] = this.rememberMe;
    return data;
  }
}
