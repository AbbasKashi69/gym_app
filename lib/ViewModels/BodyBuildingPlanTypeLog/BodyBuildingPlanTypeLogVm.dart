
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class BodyBuildingPlanTypeLogVm extends BaseViewModel {


    int? id;
int? bodyBuildingPlanTypeId;
int? userId;
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




    BodyBuildingPlanTypeLogVm(
    {
        this.id,

this.bodyBuildingPlanTypeId,

this.userId,

this.transactionId,

this.creationDate,

this.nCreationDate,

this.startDate,

this.nStartDate,

this.endDate,

this.nEndDate,

this.totalPrice,

this.nTotalPrice,

this.totalTerm
this.nTotalTerm

    });


    BodyBuildingPlanTypeLogVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['bodyBuildingPlanTypeId'];

json['userId'];

json['transactionId'];

json['creationDate'];

json['nCreationDate'];

json['startDate'];

json['nStartDate'];

json['endDate'];

json['nEndDate'];

super.intToDouble(json['totalPrice']);

json['nTotalPrice'];

super.intToDouble(json['totalTerm']);

json['nTotalTerm'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['bodyBuildingPlanTypeId'] = this.bodyBuildingPlanTypeId;

data['userId'] = this.userId;

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


    }
}
