

import '../BaseViewModel.dart';

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
this.creationDate, 
this.nCreationDate, 

    });


    ResturantInvoiceVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

walletLogId = json['walletLogId'];

transactionId = json['transactionId'];

totalQuantity = super.intToDouble(json['totalQuantity']);

nTotalQuantity = json['nTotalQuantity'];

totalPrice = super.intToDouble(json['totalPrice']);

nTotalPrice = json['nTotalPrice'];

totalTerm = super.intToDouble(json['totalTerm']);

nTotalTerm = json['nTotalTerm'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


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




        return data;
    }
}
