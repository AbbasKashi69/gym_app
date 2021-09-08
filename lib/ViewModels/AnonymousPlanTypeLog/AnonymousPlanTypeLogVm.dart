

import '../BaseViewModel.dart';

class AnonymousPlanTypeLogVm extends BaseViewModel {


    int? id;
int? anonymousPlanTypeId;
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




    AnonymousPlanTypeLogVm(
    {
        this.id, 
this.anonymousPlanTypeId, 
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
this.totalTerm, 
this.nTotalTerm, 

    });


    AnonymousPlanTypeLogVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

anonymousPlanTypeId = json['anonymousPlanTypeId'];

userId = json['userId'];

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


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['anonymousPlanTypeId'] = this.anonymousPlanTypeId;

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




        return data;
    }
}
