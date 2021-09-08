
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ResumeMajorVm extends BaseViewModel {


    int? id;
int? resumeId;
int? majorId;
String? creationDate;
String? nCreationDate;




    ResumeMajorVm(
    {
        this.id,

this.resumeId,

this.majorId,

this.creationDate
this.nCreationDate

    });


    ResumeMajorVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['resumeId'];

json['majorId'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['resumeId'] = this.resumeId;

data['majorId'] = this.majorId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
