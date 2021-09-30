import '../BaseViewModel.dart';

class TransactionAmountVm extends BaseViewModel {
  double? amount;
  String? nAmount;

  TransactionAmountVm({
    this.amount,
    this.nAmount,
  });

  TransactionAmountVm.fromJson(Map<String, dynamic> json) {
    nAmount = json['nAmount'];
    amount = super.intToDouble(json['amount']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['amount'] = this.amount;

    data['nAmount'] = this.nAmount;

    return data;
  }
}
