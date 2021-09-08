
import 'package:gym_app/ViewModels/BaseViewModel.dart';

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

this.creationDate
this.nCreationDate

    });


    SubscriptionInvoicePaymentVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['subInvoiceId'];

super.intToDouble(json['payAmount']);

json['nPayAmount'];

json['transactionId'];

json['creationDate'];

json['nCreationDate'];


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


    }
}
