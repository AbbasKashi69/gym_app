
import 'package:gym_app/ViewModels/BaseViewModel.dart';

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

this.creationDate
this.nCreationDate

    });


    ResumeSocialVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['resumeId'];

json['title'];

json['link'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['resumeId'] = this.resumeId;

data['title'] = this.title;

data['link'] = this.link;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
