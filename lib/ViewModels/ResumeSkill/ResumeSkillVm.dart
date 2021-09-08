

import '../BaseViewModel.dart';

class ResumeSkillVm extends BaseViewModel {


    int? id;
int? resumeId;
int? skillId;
String? creationDate;
String? nCreationDate;




    ResumeSkillVm(
    {
        this.id, 
this.resumeId, 
this.skillId, 
this.creationDate, 
this.nCreationDate, 

    });


    ResumeSkillVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

resumeId = json['resumeId'];

skillId = json['skillId'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['resumeId'] = this.resumeId;

data['skillId'] = this.skillId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
