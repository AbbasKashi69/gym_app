

import '../BaseViewModel.dart';

class ResumeArticleVm extends BaseViewModel {


    int? id;
int? resumeId;
String? link;
String? title;
String? description;




    ResumeArticleVm(
    {
        this.id, 
this.resumeId, 
this.link, 
this.title, 
this.description, 

    });


    ResumeArticleVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

resumeId = json['resumeId'];

link = json['link'];

title = json['title'];

description = json['description'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['resumeId'] = this.resumeId;

data['link'] = this.link;

data['title'] = this.title;

data['description'] = this.description;




        return data;
    }
}
