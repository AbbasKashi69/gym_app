

import '../BaseViewModel.dart';

class ArticleCategoryVm extends BaseViewModel {


    int? id;
int? parentId;
int? adminId;
String? title;
String? description;
int? displayOrder;
String? pic;
String? icon;
bool? isActive;
String? creationDate;
String? nCreationDate;




    ArticleCategoryVm(
    {
        this.id, 
this.parentId, 
this.adminId, 
this.title, 
this.description, 
this.displayOrder, 
this.pic, 
this.icon, 
this.isActive, 
this.creationDate, 
this.nCreationDate, 

    });


    ArticleCategoryVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

parentId = json['parentId'];

adminId = json['adminId'];

title = json['title'];

description = json['description'];

displayOrder = json['displayOrder'];

pic = json['pic'];

icon = json['icon'];

isActive = json['isActive'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['parentId'] = this.parentId;

data['adminId'] = this.adminId;

data['title'] = this.title;

data['description'] = this.description;

data['displayOrder'] = this.displayOrder;

data['pic'] = this.pic;

data['icon'] = this.icon;

data['isActive'] = this.isActive;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
