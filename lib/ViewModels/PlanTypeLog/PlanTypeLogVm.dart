import 'package:gym_app/ViewModels/BaseViewModel.dart';

class PlanTypeLogvm extends BaseViewModel {
  int? id;
  int? planTypeId;
  String? planTypeTitle;
  int? lanTypeCoachId;
  String? planTypeCoachFullName;
  int? userId;
  String? userFullName;
  int? planStatus;
  String? nPlanStatus;
  int? transactionId;
  String? creationDate;
  String? nCreationDate;
  String? startDate;
  String? nStartDate;
  String? endDate;
  String? nEndDate;
  double? totalPrice;
  String? nTotalPrice;
  double? totalTerm;
  String? nTotalTerm;
  String? userPic;
  int? planType;
  String? nPlanType;

  PlanTypeLogvm(
      {this.id,
      this.planTypeId,
      this.planTypeTitle,
      this.lanTypeCoachId,
      this.planTypeCoachFullName,
      this.userId,
      this.userFullName,
      this.planStatus,
      this.nPlanStatus,
      this.transactionId,
      this.creationDate,
      this.nCreationDate,
      this.startDate,
      this.nStartDate,
      this.endDate,
      this.nEndDate,
      this.totalPrice,
      this.nTotalPrice,
      this.totalTerm,
      this.nTotalTerm,
      this.userPic,
      this.planType,
      this.nPlanType});

  PlanTypeLogvm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planTypeId = json['planTypeId'];
    planTypeTitle = json['planTypeTitle'];
    lanTypeCoachId = json['lanTypeCoachId'];
    planTypeCoachFullName = json['planTypeCoachFullName'];
    userId = json['userId'];
    userFullName = json['userFullName'];
    planStatus = json['planStatus'];
    nPlanStatus = json['nPlanStatus'];
    transactionId = json['transactionId'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
    startDate = json['startDate'];
    nStartDate = json['nStartDate'];
    endDate = json['endDate'];
    nEndDate = json['nEndDate'];
    totalPrice = super.intToDouble(json['totalPrice']);
    nTotalPrice = json['nTotalPrice'];
    totalTerm = super.intToDouble(json['totalTerm']);
    nTotalTerm = json['nTotalTerm'];
    planType = json['planType'];
    nPlanType = json['nPlanType'];
    userPic = json['userPic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['planTypeId'] = this.planTypeId;
    data['planTypeTitle'] = this.planTypeTitle;
    data['lanTypeCoachId'] = this.lanTypeCoachId;
    data['planTypeCoachFullName'] = this.planTypeCoachFullName;
    data['userId'] = this.userId;
    data['userFullName'] = this.userFullName;
    data['planStatus'] = this.planStatus;
    data['nPlanStatus'] = this.nPlanStatus;
    data['transactionId'] = this.transactionId;
    data['creationDate'] = this.creationDate;
    data['nCreationDate'] = this.nCreationDate;
    data['startDate'] = this.startDate;
    data['nStartDate'] = this.nStartDate;
    data['endDate'] = this.endDate;
    data['nEndDate'] = this.nEndDate;
    data['totalPrice'] = this.totalPrice;
    data['nTotalPrice'] = this.nTotalPrice;
    data['totalTerm'] = this.totalTerm;
    data['nTotalTerm'] = this.nTotalTerm;
    data['planType'] = this.planType;
    data['nPlanType'] = this.nPlanType;
    return data;
  }
}
