
import 'package:gym_app/ViewModels/BaseViewModel.dart';

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

this.creationDate
this.nCreationDate

    });


    ResumeSkillVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['resumeId'];

json['skillId'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['resumeId'] = this.resumeId;

data['skillId'] = this.skillId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
