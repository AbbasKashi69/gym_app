import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeDayTermVm.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';
import 'package:gym_app/ViewModels/BodyBuildingPlanTypeDetail/BodyBuildingPlanTypeDetailsFormVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';

class BodyBuildingPlanTypeFormVm extends BaseViewModel {
  int? id;
  int? coachId;
  String? coachFullName;
  String? title;
  String? description;
  int? totalPrice;
  int? totalTerm;
  bool? isPrivate;
  String? startDate;
  String? nStartDate;
  String? endDate;
  String? nEndDate;
  List<BodyBuildingPlanTypeDetailsFormVm>? bodyBuildingPlanTypeDetails;
  List<PersonListVm>? students;
  List<AnonymousPlanTypeDayTermVm>? dayTerms;

  BodyBuildingPlanTypeFormVm(
      {this.id,
      this.coachId,
      this.coachFullName,
      this.title,
      this.description,
      this.totalPrice,
      this.totalTerm,
      this.isPrivate,
      this.startDate,
      this.nStartDate,
      this.endDate,
      this.nEndDate,
      this.bodyBuildingPlanTypeDetails,
      this.students,
      this.dayTerms});

  BodyBuildingPlanTypeFormVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coachId = json['coachId'];
    coachFullName = json['coachFullName'];
    title = json['title'];
    description = json['description'];
    totalPrice = json['totalPrice'];
    totalTerm = json['totalTerm'];
    isPrivate = json['isPrivate'];
    startDate = json['startDate'];
    nStartDate = json['nStartDate'];
    endDate = json['endDate'];
    nEndDate = json['nEndDate'];
    if (json['bodyBuildingPlanTypeDetails'] != null) {
      bodyBuildingPlanTypeDetails = [];
      json['bodyBuildingPlanTypeDetails'].forEach((v) {
        bodyBuildingPlanTypeDetails!
            .add(new BodyBuildingPlanTypeDetailsFormVm.fromJson(v));
      });
    }
    if (json['students'] != null) {
      students = [];
      json['students'].forEach((v) {
        students!.add(new PersonListVm.fromJson(v));
      });
    }
    if (json['dayTerms'] != null) {
      dayTerms = [];
      json['dayTerms'].forEach((v) {
        dayTerms!.add(new AnonymousPlanTypeDayTermVm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['coachId'] = this.coachId;
    data['coachFullName'] = this.coachFullName;
    data['title'] = this.title;
    data['description'] = this.description;
    data['totalPrice'] = this.totalPrice;
    data['totalTerm'] = this.totalTerm;
    data['isPrivate'] = this.isPrivate;
    data['startDate'] = this.startDate;
    data['nStartDate'] = this.nStartDate;
    data['endDate'] = this.endDate;
    data['nEndDate'] = this.nEndDate;
    if (this.bodyBuildingPlanTypeDetails != null) {
      data['bodyBuildingPlanTypeDetails'] =
          this.bodyBuildingPlanTypeDetails!.map((v) => v.toJson()).toList();
    }
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    if (this.dayTerms != null) {
      data['dayTerms'] = this.dayTerms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
