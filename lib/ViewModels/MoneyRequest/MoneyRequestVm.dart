

import '../BaseViewModel.dart';

class MoneyRequestVm extends BaseViewModel {


    int? id;
int? userId;
int? transactionId;
int? status;
String? nStatus;
String? description;
String? adminDescription;
String? creationDate;
String? nCreationDate;
int? paymentType;
String? nPaymentType;
String? trackingCode;
double? deposit;
String? nDeposit;
double? withdraw;
String? nWithdraw;
int? bankCardId;




    MoneyRequestVm(
    {
        this.id, 
this.userId, 
this.transactionId, 
this.status, 
this.nStatus, 
this.description, 
this.adminDescription, 
this.creationDate, 
this.nCreationDate, 
this.paymentType, 
this.nPaymentType, 
this.trackingCode, 
this.deposit, 
this.nDeposit, 
this.withdraw, 
this.nWithdraw, 
this.bankCardId, 

    });


    MoneyRequestVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

transactionId = json['transactionId'];

status = json['status'];

nStatus = json['nStatus'];

description = json['description'];

adminDescription = json['adminDescription'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

paymentType = json['paymentType'];

nPaymentType = json['nPaymentType'];

trackingCode = json['trackingCode'];

deposit = super.intToDouble(json['deposit']);

nDeposit = json['nDeposit'];

withdraw = super.intToDouble(json['withdraw']);

nWithdraw = json['nWithdraw'];

bankCardId = json['bankCardId'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['transactionId'] = this.transactionId;

data['status'] = this.status;

data['nStatus'] = this.nStatus;

data['description'] = this.description;

data['adminDescription'] = this.adminDescription;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['paymentType'] = this.paymentType;

data['nPaymentType'] = this.nPaymentType;

data['trackingCode'] = this.trackingCode;

data['deposit'] = this.deposit;

data['nDeposit'] = this.nDeposit;

data['withdraw'] = this.withdraw;

data['nWithdraw'] = this.nWithdraw;

data['bankCardId'] = this.bankCardId;




        return data;
    }
}
