import 'package:gym_app/ViewModels/BaseViewModel.dart';

class TransferToBankVm extends BaseViewModel {
  int? amount;
  int? bankId;

  TransferToBankVm(
      {this.amount,
        this.bankId,
  });

  TransferToBankVm.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    bankId = json['bankId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['bankId'] = this.bankId;
    return data;
  }
}
