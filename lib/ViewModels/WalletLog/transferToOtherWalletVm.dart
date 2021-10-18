import 'package:gym_app/ViewModels/BaseViewModel.dart';

class TransferToOtherWalletsVm extends BaseViewModel {
  int? amount;
  int? phone;

  TransferToOtherWalletsVm(
      {this.amount,
        this.phone,
      });

  TransferToOtherWalletsVm.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    phone = json['phoneOtherUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['phoneOtherUser'] = this.phone;
    return data;
  }
}
