

import '../BaseViewModel.dart';

class BankCardVm extends BaseViewModel {


    int? id;
int? userId;
String? bankName;
String? accountNumber;
String? cardNumber;
String? shababNumber;
String? creationDate;
String? nCreationDate;
String? pic;




    BankCardVm(
    {
        this.id, 
this.userId, 
this.bankName, 
this.accountNumber, 
this.cardNumber, 
this.shababNumber, 
this.creationDate, 
this.nCreationDate, 
this.pic, 

    });


    BankCardVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

bankName = json['bankName'];

accountNumber = json['accountNumber'];

cardNumber = json['cardNumber'];

shababNumber = json['shababNumber'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

pic = json['pic'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['bankName'] = this.bankName;

data['accountNumber'] = this.accountNumber;

data['cardNumber'] = this.cardNumber;

data['shababNumber'] = this.shababNumber;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['pic'] = this.pic;




        return data;
    }
}
