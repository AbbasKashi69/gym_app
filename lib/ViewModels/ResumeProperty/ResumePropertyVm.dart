

import '../BaseViewModel.dart';

class ResumePropertyVm extends BaseViewModel {


    int? id;
int? resumeId;
String? title;
String? description;
String? creationDate;
String? nCreationDate;




    ResumePropertyVm(
    {
        this.id, 
this.resumeId, 
this.title, 
this.description, 
this.creationDate, 
this.nCreationDate, 

    });


    ResumePropertyVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

resumeId = json['resumeId'];

title = json['title'];

description = json['description'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['resumeId'] = this.resumeId;

data['title'] = this.title;

data['description'] = this.description;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
