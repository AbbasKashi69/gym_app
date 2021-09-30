import 'package:gym_app/ViewModels/BaseViewModel.dart';

class CoachStudentVm extends BaseViewModel {
  int? id;
  int? coachId;
  String? coachFullName;
  String? coachUserName;
  String? coachPic;
  int? studentId;
  String? studentFullName;
  String? studentUserName;
  String? studentPhoneNumber;
  String? studentPic;
  String? studentEmail;
  int? status;
  String? nStatus;
  String? creationDate;
  String? nCreationDate;

  CoachStudentVm(
      {this.id,
      this.coachId,
      this.coachFullName,
      this.coachUserName,
      this.coachPic,
      this.studentId,
      this.studentFullName,
      this.studentUserName,
      this.studentPhoneNumber,
      this.studentPic,
      this.studentEmail,
      this.status,
      this.nStatus,
      this.creationDate,
      this.nCreationDate});

  CoachStudentVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coachId = json['coachId'];
    coachFullName = json['coachFullName'];
    coachUserName = json['coachUserName'];
    coachPic = json['coachPic'];
    studentId = json['studentId'];
    studentFullName = json['studentFullName'];
    studentUserName = json['studentUserName'];
    studentPhoneNumber = json['studentPhoneNumber'];
    studentPic = json['studentPic'];
    studentEmail = json['studentEmail'];
    status = json['status'];
    nStatus = json['nStatus'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coachId'] = this.coachId;
    data['coachFullName'] = this.coachFullName;
    data['coachUserName'] = this.coachUserName;
    data['coachPic'] = this.coachPic;
    data['studentId'] = this.studentId;
    data['studentFullName'] = this.studentFullName;
    data['studentUserName'] = this.studentUserName;
    data['studentPhoneNumber'] = this.studentPhoneNumber;
    data['studentPic'] = this.studentPic;
    data['studentEmail'] = this.studentEmail;
    data['status'] = this.status;
    data['nStatus'] = this.nStatus;
    data['creationDate'] = this.creationDate;
    data['nCreationDate'] = this.nCreationDate;
    return data;
  }
}
