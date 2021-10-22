import 'package:gym_app/ViewModels/BaseViewModel.dart';

class TransferToOtherWalletsVm extends BaseViewModel {
  double? amount;
  String? phoneOtherUser;

  TransferToOtherWalletsVm(
      {this.amount,
        this.phoneOtherUser,
      });

  TransferToOtherWalletsVm.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    phoneOtherUser = json['phoneOtherUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['phoneOtherUser'] = this.phoneOtherUser
    ;
    return data;
  }
}
