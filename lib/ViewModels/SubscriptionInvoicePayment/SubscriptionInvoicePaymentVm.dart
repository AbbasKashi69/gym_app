

import '../BaseViewModel.dart';

class SubscriptionInvoicePaymentVm extends BaseViewModel {


    int? id;
int? subInvoiceId;
double? payAmount;
String? nPayAmount;
int? transactionId;
String? creationDate;
String? nCreationDate;




    SubscriptionInvoicePaymentVm(
    {
        this.id, 
this.subInvoiceId, 
this.payAmount, 
this.nPayAmount, 
this.transactionId, 
this.creationDate, 
this.nCreationDate, 

    });


    SubscriptionInvoicePaymentVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

subInvoiceId = json['subInvoiceId'];

payAmount = super.intToDouble(json['payAmount']);

nPayAmount = json['nPayAmount'];

transactionId = json['transactionId'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['subInvoiceId'] = this.subInvoiceId;

data['payAmount'] = this.payAmount;

data['nPayAmount'] = this.nPayAmount;

data['transactionId'] = this.transactionId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
