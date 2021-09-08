
import 'package:gym_app/ViewModels/BaseViewModel.dart';

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

this.bankCardId

    });


    MoneyRequestVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['userId'];

json['transactionId'];

json['status'];

json['nStatus'];

json['description'];

json['adminDescription'];

json['creationDate'];

json['nCreationDate'];

json['paymentType'];

json['nPaymentType'];

json['trackingCode'];

super.intToDouble(json['deposit']);

json['nDeposit'];

super.intToDouble(json['withdraw']);

json['nWithdraw'];

json['bankCardId'];


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


    }
}
