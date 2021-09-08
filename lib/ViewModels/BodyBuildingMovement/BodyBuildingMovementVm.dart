

import '../BaseViewModel.dart';

class BodyBuildingMovementVm extends BaseViewModel {


    int? id;
int? userId;
int? adminId;
String? title;
String? description;
String? filePath;
int? status;
String? nStatus;
bool? isActive;
String? creationDate;
String? nCreationDate;




    BodyBuildingMovementVm(
    {
        this.id, 
this.userId, 
this.adminId, 
this.title, 
this.description, 
this.filePath, 
this.status, 
this.nStatus, 
this.isActive, 
this.creationDate, 
this.nCreationDate, 

    });


    BodyBuildingMovementVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

adminId = json['adminId'];

title = json['title'];

description = json['description'];

filePath = json['filePath'];

status = json['status'];

nStatus = json['nStatus'];

isActive = json['isActive'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['adminId'] = this.adminId;

data['title'] = this.title;

data['description'] = this.description;

data['filePath'] = this.filePath;

data['status'] = this.status;

data['nStatus'] = this.nStatus;

data['isActive'] = this.isActive;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
