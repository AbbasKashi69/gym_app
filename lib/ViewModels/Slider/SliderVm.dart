

import '../BaseViewModel.dart';

class SliderVm extends BaseViewModel {


    int? id;
int? adminId;
String? title;
String? description;
String? link;
String? pic;
bool? isActive;
String? creationDate;
String? nCreationDate;
String? startDate;
String? nStartDate;
String? endDate;
String? nEndDate;




    SliderVm(
    {
        this.id, 
this.adminId, 
this.title, 
this.description, 
this.link, 
this.pic, 
this.isActive, 
this.creationDate, 
this.nCreationDate, 
this.startDate, 
this.nStartDate, 
this.endDate, 
this.nEndDate, 

    });


    SliderVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

adminId = json['adminId'];

title = json['title'];

description = json['description'];

link = json['link'];

pic = json['pic'];

isActive = json['isActive'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

startDate = json['startDate'];

nStartDate = json['nStartDate'];

endDate = json['endDate'];

nEndDate = json['nEndDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['adminId'] = this.adminId;

data['title'] = this.title;

data['description'] = this.description;

data['link'] = this.link;

data['pic'] = this.pic;

data['isActive'] = this.isActive;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['startDate'] = this.startDate;

data['nStartDate'] = this.nStartDate;

data['endDate'] = this.endDate;

data['nEndDate'] = this.nEndDate;




        return data;
    }
}
