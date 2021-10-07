import 'package:gym_app/ViewModels/BaseViewModel.dart';

class CoachStudentProfileVm extends BaseViewModel {
  int? userId;
  String? userFullName;
  String? userName;
  String? userPic;
  String? userRoleName;
  String? userPhoneNumber;
  String? userEmail;
  String? registeryDate;
  String? nRegisteryDate;
  int? anonymousPlanCount;
  int? bodyBuildingPlanCount;
  int? dietPlanCount;
  int? exercisePlanCount;
  int? studentCount;
  int? coachCount;
  double? weight;
  double? height;
  String? nHeight;
  String? nWeight;

  CoachStudentProfileVm(
      {this.userId,
      this.userFullName,
      this.userName,
      this.userPic,
      this.userRoleName,
      this.userPhoneNumber,
      this.userEmail,
      this.registeryDate,
      this.nRegisteryDate,
      this.anonymousPlanCount,
      this.bodyBuildingPlanCount,
      this.dietPlanCount,
      this.exercisePlanCount,
      this.studentCount,
      this.coachCount,
      this.weight,
      this.height,
      this.nHeight,
      this.nWeight});

  CoachStudentProfileVm.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    userFullName = json['userFullName'];
    userName = json['userName'];
    userPic = json['userPic'];
    userRoleName = json['userRoleName'];
    userPhoneNumber = json['userPhoneNumber'];
    userEmail = json['userEmail'];
    registeryDate = json['registeryDate'];
    nRegisteryDate = json['nRegisteryDate'];
    anonymousPlanCount = json['anonymousPlanCount'];
    bodyBuildingPlanCount = json['bodyBuildingPlanCount'];
    dietPlanCount = json['dietPlanCount'];
    exercisePlanCount = json['exercisePlanCount'];
    studentCount = json['studentCount'];
    coachCount = json['coachCount'];
    weight = super.intToDouble(json['weight']);
    height = super.intToDouble(json['height']);
    nHeight = json['nHeight'];
    nWeight = json['nWeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userFullName'] = this.userFullName;
    data['userName'] = this.userName;
    data['userPic'] = this.userPic;
    data['userRoleName'] = this.userRoleName;
    data['userPhoneNumber'] = this.userPhoneNumber;
    data['userEmail'] = this.userEmail;
    data['registeryDate'] = this.registeryDate;
    data['nRegisteryDate'] = this.nRegisteryDate;
    data['anonymousPlanCount'] = this.anonymousPlanCount;
    data['bodyBuildingPlanCount'] = this.bodyBuildingPlanCount;
    data['dietPlanCount'] = this.dietPlanCount;
    data['exercisePlanCount'] = this.exercisePlanCount;
    data['studentCount'] = this.studentCount;
    data['coachCount'] = this.coachCount;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['nHeight'] = this.nHeight;
    data['nWeight'] = this.nWeight;
    return data;
  }
}
