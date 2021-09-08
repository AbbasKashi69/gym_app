

import '../BaseViewModel.dart';

class SettingVm extends BaseViewModel {


    int? id;
int? type;
String? nType;
String? title;
String? description;
String? pic;
int? adminId;
String? creationDate;
String? nCreationDate;




    SettingVm(
    {
        this.id, 
this.type, 
this.nType, 
this.title, 
this.description, 
this.pic, 
this.adminId, 
this.creationDate, 
this.nCreationDate, 

    });


    SettingVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

type = json['type'];

nType = json['nType'];

title = json['title'];

description = json['description'];

pic = json['pic'];

adminId = json['adminId'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['type'] = this.type;

data['nType'] = this.nType;

data['title'] = this.title;

data['description'] = this.description;

data['pic'] = this.pic;

data['adminId'] = this.adminId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
