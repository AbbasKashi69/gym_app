

import '../BaseViewModel.dart';

class SubscriptionTypeVm extends BaseViewModel {


    int? id;
int? adminId;
int? dayCount;
String? title;
String? description;
String? creationDate;
String? nCreationDate;
double? priceAmount;
String? nPriceAmount;
double? discountAmount;
String? nDiscountAmount;
String? colorCode;
bool? isActive;
String? icon;
String? pic;




    SubscriptionTypeVm(
    {
        this.id, 
this.adminId, 
this.dayCount, 
this.title, 
this.description, 
this.creationDate, 
this.nCreationDate, 
this.priceAmount, 
this.nPriceAmount, 
this.discountAmount, 
this.nDiscountAmount, 
this.colorCode, 
this.isActive, 
this.icon, 
this.pic, 

    });


    SubscriptionTypeVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

adminId = json['adminId'];

dayCount = json['dayCount'];

title = json['title'];

description = json['description'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

priceAmount = super.intToDouble(json['priceAmount']);

nPriceAmount = json['nPriceAmount'];

discountAmount = super.intToDouble(json['discountAmount']);

nDiscountAmount = json['nDiscountAmount'];

colorCode = json['colorCode'];

isActive = json['isActive'];

icon = json['icon'];

pic = json['pic'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['adminId'] = this.adminId;

data['dayCount'] = this.dayCount;

data['title'] = this.title;

data['description'] = this.description;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['priceAmount'] = this.priceAmount;

data['nPriceAmount'] = this.nPriceAmount;

data['discountAmount'] = this.discountAmount;

data['nDiscountAmount'] = this.nDiscountAmount;

data['colorCode'] = this.colorCode;

data['isActive'] = this.isActive;

data['icon'] = this.icon;

data['pic'] = this.pic;




        return data;
    }
}
