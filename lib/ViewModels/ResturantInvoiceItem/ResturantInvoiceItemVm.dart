
import 'package:gym_app/ViewModels/BaseViewModel.dart';

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

this.creationDate
this.nCreationDate

    });


    ResturantInvoiceItemVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['invoiceId'];

json['foodId'];

super.intToDouble(json['quantity']);

json['nQuantity'];

super.intToDouble(json['price']);

json['nPrice'];

super.intToDouble(json['term']);

json['nTerm'];

json['creationDate'];

json['nCreationDate'];


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


    }
}
