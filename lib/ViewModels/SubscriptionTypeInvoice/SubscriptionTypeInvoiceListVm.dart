import '../BaseViewModel.dart';

// class Old {
//   Old({
//     required this.id,
//     required this.userId,
//     required this.subscriptionTypeDescription,
//     required this.subscriptionTypeTitle,
//     required this.action,
//     required this.bankName,
//     required this.creationDate,
//     required this.nCreationDate,
//     required this.totalPrice,
//     required this.nTotalPrice,
//     required this.totalTerm,
//     required this.nTotalTerm,
//     required this.payablePrice,
//     required this.nPayablePrice,
//     required this.subscriptionTypeColorCode,
//     required this.dayCount,
//   });
//   late final int id;
//   late final int userId;
//   late final String subscriptionTypeDescription;
//   late final String subscriptionTypeTitle;
//   late final String action;
//   late final String bankName;
//   late final String creationDate;
//   late final String nCreationDate;
//   late final double totalPrice;
//   late final String nTotalPrice;
//   late final double totalTerm;
//   late final String nTotalTerm;
//   late final double payablePrice;
//   late final String nPayablePrice;
//   late final String subscriptionTypeColorCode;
//   late final int dayCount;
//
//   Old.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     userId = json['UserId'];
//     subscriptionTypeDescription = json['SubscriptionTypeDescription'];
//     subscriptionTypeTitle = json['SubscriptionTypeTitle'];
//     action = json['Action'];
//     bankName = json['BankName'];
//     creationDate = json['CreationDate'];
//     nCreationDate = json['NCreationDate'];
//     totalPrice = json['TotalPrice'];
//     nTotalPrice = json['NTotalPrice'];
//     totalTerm = json['TotalTerm'];
//     nTotalTerm = json['NTotalTerm'];
//     payablePrice = json['PayablePrice'];
//     nPayablePrice = json['NPayablePrice'];
//     subscriptionTypeColorCode = json['SubscriptionTypeColorCode'];
//     dayCount = json['DayCount'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['UserId'] = userId;
//     data['SubscriptionTypeDescription'] = subscriptionTypeDescription;
//     data['SubscriptionTypeTitle'] = subscriptionTypeTitle;
//     data['Action'] = action;
//     data['BankName'] = bankName;
//     data['CreationDate'] = creationDate;
//     data['NCreationDate'] = nCreationDate;
//     data['TotalPrice'] = totalPrice;
//     data['NTotalPrice'] = nTotalPrice;
//     data['TotalTerm'] = totalTerm;
//     data['NTotalTerm'] = nTotalTerm;
//     data['PayablePrice'] = payablePrice;
//     data['NPayablePrice'] = nPayablePrice;
//     data['SubscriptionTypeColorCode'] = subscriptionTypeColorCode;
//     data['DayCount'] = dayCount;
//     return data;
//   }
// }

class SubscriptionTypeInvoiceListVm extends BaseViewModel {
  int? id;
  int? userId;
  String? subscriptionTypeDescription;
  String? subscriptionTypeTitle;
  String? action;
  String? bankName;
  String? creationDate;
  String? nCreationDate;
  double? totalPrice;
  String? nTotalPrice;
  double? totalTerm;
  String? nTotalTerm;
  double? payablePrice;
  String? nPayablePrice;
  String? subscriptionTypeColorCode;
  int? dayCount;

  SubscriptionTypeInvoiceListVm({
    this.nCreationDate,
    this.dayCount,
    this.id,
    this.subscriptionTypeTitle,
    this.creationDate,
    this.nTotalTerm,
    this.subscriptionTypeColorCode,
    this.bankName,
    this.subscriptionTypeDescription,
    this.userId,
    this.action,
    this.nPayablePrice,
    this.nTotalPrice,
    this.payablePrice,
    this.totalPrice,
    this.totalTerm,
  });

  SubscriptionTypeInvoiceListVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    subscriptionTypeDescription = json['subscriptionTypeDescription'];
    subscriptionTypeTitle = json['subscriptionTypeTitle'];
    action = json['action'];
    bankName = json['bankName'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
    nTotalPrice = json['nTotalPrice'];
    totalTerm = json['totalTerm'];
    nTotalTerm = json['nTotalTerm'];
    payablePrice = json['payablePrice'];
    nPayablePrice = json['nPayablePrice'];
    subscriptionTypeColorCode = json['subscriptionTypeColorCode'];
    dayCount = json['dayCount'];
    totalPrice = super.intToDouble(json['totalPrice']);
    nTotalPrice = json['nTotalPrice'];
    totalTerm = super.intToDouble(json['totalTerm']);
    nTotalTerm = json['nTotalTerm'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['subscriptionTypeDescription'] = subscriptionTypeDescription;
    data['subscriptionTypeTitle'] = subscriptionTypeTitle;
    data['action'] = action;
    data['bankName'] = bankName;
    data['creationDate'] = creationDate;
    data['nCreationDate'] = nCreationDate;
    data['totalPrice'] = totalPrice;
    data['nTotalPrice'] = nTotalPrice;
    data['totalTerm'] = totalTerm;
    data['nTotalTerm'] = nTotalTerm;
    data['payablePrice'] = payablePrice;
    data['nPayablePrice'] = nPayablePrice;
    data['subscriptionTypeColorCode'] = subscriptionTypeColorCode;
    data['dayCount'] = dayCount;
    return data;
  }
}
