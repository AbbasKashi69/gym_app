
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ResturantInvoiceVm extends BaseViewModel {


    int? id;
int? userId;
int? walletLogId;
int? transactionId;
double? totalQuantity;
String? nTotalQuantity;
double? totalPrice;
String? nTotalPrice;
double? totalTerm;
String? nTotalTerm;
String? creationDate;
String? nCreationDate;




    ResturantInvoiceVm(
    {
        this.id,

this.userId,

this.walletLogId,

this.transactionId,

this.totalQuantity,

this.nTotalQuantity,

this.totalPrice,

this.nTotalPrice,

this.totalTerm,

this.nTotalTerm,

this.creationDate
this.nCreationDate

    });


    ResturantInvoiceVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['userId'];

json['walletLogId'];

json['transactionId'];

super.intToDouble(json['totalQuantity']);

json['nTotalQuantity'];

super.intToDouble(json['totalPrice']);

json['nTotalPrice'];

super.intToDouble(json['totalTerm']);

json['nTotalTerm'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['userId'] = this.userId;

data['walletLogId'] = this.walletLogId;

data['transactionId'] = this.transactionId;

data['totalQuantity'] = this.totalQuantity;

data['nTotalQuantity'] = this.nTotalQuantity;

data['totalPrice'] = this.totalPrice;

data['nTotalPrice'] = this.nTotalPrice;

data['totalTerm'] = this.totalTerm;

data['nTotalTerm'] = this.nTotalTerm;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
