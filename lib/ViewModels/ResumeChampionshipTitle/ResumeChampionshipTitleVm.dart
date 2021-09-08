
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ResumeChampionshipTitleVm extends BaseViewModel {


    int? id;
int? resumeId;
String? title;
String? description;
String? creationDate;
String? nCreationDate;




    ResumeChampionshipTitleVm(
    {
        this.id,

this.resumeId,

this.title,

this.description,

this.creationDate
this.nCreationDate

    });


    ResumeChampionshipTitleVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['resumeId'];

json['title'];

json['description'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['resumeId'] = this.resumeId;

data['title'] = this.title;

data['description'] = this.description;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
