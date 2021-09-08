

import '../BaseViewModel.dart';

class WalletLogVm extends BaseViewModel {


    int? id;
int? userId;
int? transactionId;
double? walletValue;
String? nWalletValue;
String? creationDate;
String? nCreationDate;
String? description;




    WalletLogVm(
    {
        this.id, 
this.userId, 
this.transactionId, 
this.walletValue, 
this.nWalletValue, 
this.creationDate, 
this.nCreationDate, 
this.description, 

    });


    WalletLogVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

transactionId = json['transactionId'];

walletValue = super.intToDouble(json['walletValue']);

nWalletValue = json['nWalletValue'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

description = json['description'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['transactionId'] = this.transactionId;

data['walletValue'] = this.walletValue;

data['nWalletValue'] = this.nWalletValue;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['description'] = this.description;




        return data;
    }
}
