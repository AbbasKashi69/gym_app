

import '../BaseViewModel.dart';

class BodyBuildingPlanTypeDetailVm extends BaseViewModel {


    int? id;
int? parentId;
int? bodyBuildingPlanTypeId;
int? dayNumber;
int? termNumber;
int? displayOrder;
String? title;
String? description;
int? setCount;
String? setDescription;
String? creationDate;
String? nCreationDate;




    BodyBuildingPlanTypeDetailVm(
    {
        this.id, 
this.parentId, 
this.bodyBuildingPlanTypeId, 
this.dayNumber, 
this.termNumber, 
this.displayOrder, 
this.title, 
this.description, 
this.setCount, 
this.setDescription, 
this.creationDate, 
this.nCreationDate, 

    });


    BodyBuildingPlanTypeDetailVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

parentId = json['parentId'];

bodyBuildingPlanTypeId = json['bodyBuildingPlanTypeId'];

dayNumber = json['dayNumber'];

termNumber = json['termNumber'];

displayOrder = json['displayOrder'];

title = json['title'];

description = json['description'];

setCount = json['setCount'];

setDescription = json['setDescription'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['parentId'] = this.parentId;

data['bodyBuildingPlanTypeId'] = this.bodyBuildingPlanTypeId;

data['dayNumber'] = this.dayNumber;

data['termNumber'] = this.termNumber;

data['displayOrder'] = this.displayOrder;

data['title'] = this.title;

data['description'] = this.description;

data['setCount'] = this.setCount;

data['setDescription'] = this.setDescription;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
