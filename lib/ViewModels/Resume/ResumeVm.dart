

import '../BaseViewModel.dart';

class ResumeVm extends BaseViewModel {


    int? id;
int? userId;
int? age;
String? instagram;
String? telegram;
String? description;
String? creationDate;
String? nCreationDate;




    ResumeVm(
    {
        this.id, 
this.userId, 
this.age, 
this.instagram, 
this.telegram, 
this.description, 
this.creationDate, 
this.nCreationDate, 

    });


    ResumeVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

age = json['age'];

instagram = json['instagram'];

telegram = json['telegram'];

description = json['description'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['age'] = this.age;

data['instagram'] = this.instagram;

data['telegram'] = this.telegram;

data['description'] = this.description;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
