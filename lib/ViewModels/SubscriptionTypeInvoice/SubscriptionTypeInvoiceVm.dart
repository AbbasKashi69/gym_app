

import '../BaseViewModel.dart';

class SubscriptionTypeInvoiceVm extends BaseViewModel {


    int? id;
int? userId;
int? adminId;
String? subscriptionTypeTitle;
String? subscriptionTypeDescription;
String? creationDate;
String? nCreationDate;
double? totalPrice;
String? nTotalPrice;
double? totalTerm;
String? nTotalTerm;
String? subscriptionTypeColorCode;
String? startDate;
String? nStartDate;
String? endDate;
String? nEndDate;
int? dayCount;



    SubscriptionTypeInvoiceVm(
    {
        this.id, 
this.userId, 
this.adminId, 
this.subscriptionTypeTitle, 
this.subscriptionTypeDescription, 
this.creationDate, 
this.nCreationDate, 
this.totalPrice, 
this.nTotalPrice, 
this.totalTerm, 
this.nTotalTerm,
        this.dayCount,
this.subscriptionTypeColorCode, 
this.startDate, 
this.nStartDate, 
this.endDate, 
this.nEndDate, 

    });


    SubscriptionTypeInvoiceVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

adminId = json['adminId'];

subscriptionTypeTitle = json['subscriptionTypeTitle'];

subscriptionTypeDescription = json['subscriptionTypeDescription'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

totalPrice = super.intToDouble(json['totalPrice']);

nTotalPrice = json['nTotalPrice'];

totalTerm = super.intToDouble(json['totalTerm']);

nTotalTerm = json['nTotalTerm'];

subscriptionTypeColorCode = json['subscriptionTypeColorCode'];

startDate = json['startDate'];

nStartDate = json['nStartDate'];

endDate = json['endDate'];

nEndDate = json['nEndDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['adminId'] = this.adminId;

data['subscriptionTypeTitle'] = this.subscriptionTypeTitle;

data['subscriptionTypeDescription'] = this.subscriptionTypeDescription;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['totalPrice'] = this.totalPrice;

data['nTotalPrice'] = this.nTotalPrice;

data['totalTerm'] = this.totalTerm;

data['nTotalTerm'] = this.nTotalTerm;

data['subscriptionTypeColorCode'] = this.subscriptionTypeColorCode;

data['startDate'] = this.startDate;

data['nStartDate'] = this.nStartDate;

data['endDate'] = this.endDate;

data['nEndDate'] = this.nEndDate;




        return data;
    }
}
