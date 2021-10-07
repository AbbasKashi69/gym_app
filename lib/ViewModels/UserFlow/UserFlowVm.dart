import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/Person/PersonVm.dart';

class UserFlowVm extends BaseViewModel {
  late int id;
  late int userId;
  late int coachId;
  late double weight;
  late double height;
  late double trainingTime;
  late double dietPlanFollowPercent;
  late double bodyBuildingPlanFollowPercent;
  late double anonymousPlanFollowPercent;
  late String? title;
  late String nWeight;
  late String nHeight;
  late String description;
  String? creationDate;
  late String nCreationDate;
  List<UserFlowFiles>? userFlowFiles;
  List<FileVm>? listFileVm;

  UserFlowVm(
      {this.id = 0,
      this.userId = 0,
      required this.coachId,
      required this.weight,
      required this.height,
      required this.trainingTime,
      required this.dietPlanFollowPercent,
      required this.bodyBuildingPlanFollowPercent,
      this.anonymousPlanFollowPercent = 0,
      this.title = "",
      this.nWeight = "",
      this.nHeight = "",
      this.description = "",
      this.creationDate,
      required this.nCreationDate,
      this.listFileVm,
      this.userFlowFiles});

  UserFlowVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    coachId = json['coachId'];
    weight = super.intToDouble(json['weight']);
    height = super.intToDouble(json['height']);
    trainingTime = super.intToDouble(json['trainingTime']);
    dietPlanFollowPercent = super.intToDouble(json['dietPlanFollowPercent']);
    bodyBuildingPlanFollowPercent =
        super.intToDouble(json['bodyBuildingPlanFollowPercent']);
    anonymousPlanFollowPercent =
        super.intToDouble(json['anonymousPlanFollowPercent']);
    title = json['title'];
    nWeight = json['nWeight'];
    nHeight = json['nHeight'];
    description = json['description'] ?? "";
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
    if (json['userFlowFiles'] != null) {
      userFlowFiles = [];
      json['userFlowFiles'].forEach((v) {
        userFlowFiles!.add(new UserFlowFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['coachId'] = this.coachId;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['trainingTime'] = this.trainingTime;
    data['dietPlanFollowPercent'] = this.dietPlanFollowPercent;
    data['bodyBuildingPlanFollowPercent'] = this.bodyBuildingPlanFollowPercent;
    data['anonymousPlanFollowPercent'] = this.anonymousPlanFollowPercent;
    data['title'] = this.title;
    // data['nWeight'] = this.nWeight;
    // data['nHeight'] = this.nHeight;
    data['description'] = this.description;
    // data['creationDate'] = this.creationDate;
    data['nCreationDate'] = this.nCreationDate;
    if (this.userFlowFiles != null) {
      data['userFlowFiles'] =
          this.userFlowFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserFlowFiles extends BaseViewModel {
  late String path;
  UserFlowFiles({required this.path});
  UserFlowFiles.fromJson(Map<String, dynamic> json) {
    path = json['path'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['path'] = path;
    return data;
  }
}
