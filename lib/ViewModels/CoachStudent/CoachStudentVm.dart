
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class CoachStudentVm extends BaseViewModel {


    int? id;
int? coachId;
int? studentId;
int? status;
String? nStatus;
String? creationDate;
String? nCreationDate;




    CoachStudentVm(
    {
        this.id,

this.coachId,

this.studentId,

this.status,

this.nStatus,

this.creationDate
this.nCreationDate

    });


    CoachStudentVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['coachId'];

json['studentId'];

json['status'];

json['nStatus'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['coachId'] = this.coachId;

data['studentId'] = this.studentId;

data['status'] = this.status;

data['nStatus'] = this.nStatus;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
