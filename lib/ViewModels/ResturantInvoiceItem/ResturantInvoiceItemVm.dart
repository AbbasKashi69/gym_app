

import '../BaseViewModel.dart';

class ResturantInvoiceItemVm extends BaseViewModel {


    int? id;
int? invoiceId;
int? foodId;
double? quantity;
String? nQuantity;
double? price;
String? nPrice;
double? term;
String? nTerm;
String? creationDate;
String? nCreationDate;




    ResturantInvoiceItemVm(
    {
        this.id, 
this.invoiceId, 
this.foodId, 
this.quantity, 
this.nQuantity, 
this.price, 
this.nPrice, 
this.term, 
this.nTerm, 
this.creationDate, 
this.nCreationDate, 

    });


    ResturantInvoiceItemVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

invoiceId = json['invoiceId'];

foodId = json['foodId'];

quantity = super.intToDouble(json['quantity']);

nQuantity = json['nQuantity'];

price = super.intToDouble(json['price']);

nPrice = json['nPrice'];

term = super.intToDouble(json['term']);

nTerm = json['nTerm'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['invoiceId'] = this.invoiceId;

data['foodId'] = this.foodId;

data['quantity'] = this.quantity;

data['nQuantity'] = this.nQuantity;

data['price'] = this.price;

data['nPrice'] = this.nPrice;

data['term'] = this.term;

data['nTerm'] = this.nTerm;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
