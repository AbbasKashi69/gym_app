
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class DietPlanTypeLogVm extends BaseViewModel {


    int? id;
int? dietPlanTypeId;
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




    DietPlanTypeLogVm(
    {
        this.id,

this.dietPlanTypeId,

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


    DietPlanTypeLogVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['dietPlanTypeId'];

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

data['dietPlanTypeId'] = this.dietPlanTypeId;

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
