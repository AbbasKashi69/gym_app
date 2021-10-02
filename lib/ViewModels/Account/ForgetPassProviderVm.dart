import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ForgetPassProviderVm extends BaseViewModel {
  String? userName;
  String provider = 'Phone';

  ForgetPassProviderVm({this.userName, this.provider = "Phone"});

  ForgetPassProviderVm.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    provider = json['provider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['provider'] = this.provider;
    return data;
  }
}
