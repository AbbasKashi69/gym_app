

import '../BaseViewModel.dart';

class ResumeSocialVm extends BaseViewModel {


    int? id;
int? resumeId;
String? title;
String? link;
String? creationDate;
String? nCreationDate;




    ResumeSocialVm(
    {
        this.id, 
this.resumeId, 
this.title, 
this.link, 
this.creationDate, 
this.nCreationDate, 

    });


    ResumeSocialVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

resumeId = json['resumeId'];

title = json['title'];

link = json['link'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['resumeId'] = this.resumeId;

data['title'] = this.title;

data['link'] = this.link;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
