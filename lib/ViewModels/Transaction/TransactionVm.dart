
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class TransactionVm extends BaseViewModel {


    int? id;
int? parentId;
String? bankName;
String? trackingCode;
double? amount;
String? nAmount;
String? creationDate;
String? nCreationDate;
bool? isSuccess;
String? description;
int? type;
String? nType;
int? userId;




    TransactionVm(
    {
        this.id,

this.parentId,

this.bankName,

this.trackingCode,

this.amount,

this.nAmount,

this.creationDate,

this.nCreationDate,

this.isSuccess,

this.description,

this.type,

this.nType,

this.userId

    });


    TransactionVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['parentId'];

json['bankName'];

json['trackingCode'];

super.intToDouble(json['amount']);

json['nAmount'];

json['creationDate'];

json['nCreationDate'];

json['isSuccess'];

json['description'];

json['type'];

json['nType'];

json['userId'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['parentId'] = this.parentId;

data['bankName'] = this.bankName;

data['trackingCode'] = this.trackingCode;

data['amount'] = this.amount;

data['nAmount'] = this.nAmount;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['isSuccess'] = this.isSuccess;

data['description'] = this.description;

data['type'] = this.type;

data['nType'] = this.nType;

data['userId'] = this.userId;


    }
}
