

import '../BaseViewModel.dart';

class ResturantFoodVm extends BaseViewModel {


    int? id;
int? adminId;
String? title;
double? price;
String? nPrice;
String? pic;
String? creationDate;
String? nCreationDate;
bool? isActive;




    ResturantFoodVm(
    {
        this.id, 
this.adminId, 
this.title, 
this.price, 
this.nPrice, 
this.pic, 
this.creationDate, 
this.nCreationDate, 
this.isActive, 

    });


    ResturantFoodVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

adminId = json['adminId'];

title = json['title'];

price = super.intToDouble(json['price']);

nPrice = json['nPrice'];

pic = json['pic'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

isActive = json['isActive'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['adminId'] = this.adminId;

data['title'] = this.title;

data['price'] = this.price;

data['nPrice'] = this.nPrice;

data['pic'] = this.pic;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['isActive'] = this.isActive;




        return data;
    }
}
