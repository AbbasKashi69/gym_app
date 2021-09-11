import 'package:gym_app/ViewModels/BaseViewModel.dart';

class IncreaseCreditVm extends BaseViewModel {
  int? id;
  bool? isOnline;
  int? increaseCreditAmount;
  String? invoiceTrackingCode;

  IncreaseCreditVm(
      {this.id,
      this.isOnline,
      this.increaseCreditAmount,
      this.invoiceTrackingCode});

  IncreaseCreditVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    isOnline = json['isOnline'];
    increaseCreditAmount = json['increaseCreditAmount'];
    invoiceTrackingCode = json['invoiceTrackingCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['isOnline'] = this.isOnline;
    data['increaseCreditAmount'] = this.increaseCreditAmount;
    data['invoiceTrackingCode'] = this.invoiceTrackingCode;
    return data;
  }
}
