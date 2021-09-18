import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeDayTermVm.dart';
import 'package:gym_app/ViewModels/AnonymousPlanTypeDetail/AnonymousPlanTypeDetailFormVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';

class AnonymousPlantypeFormVm {
  int? id;
  int? coachId;
  String? coachFullName;
  String? title;
  String? description;
  int? totalPrice;
  int? totalTerm;
  int? dayCount;
  String? startDate;
  String? nStartDate;
  String? endDate;
  String? nEndDate;
  bool? isPrivate;
  List<AnonymousPlanTypeDetailFormVm>? anonymousPlanTypeDetailForms;
  List<PersonListVm>? students;
  List<AnonymousPlanTypeDayTermVm>? dayTerms;

  AnonymousPlantypeFormVm(
      {this.id = 0,
      this.coachId = 0,
      this.coachFullName,
      this.title,
      this.description,
      this.totalPrice,
      this.totalTerm = 0,
      this.dayCount = 0,
      this.startDate,
      this.nStartDate,
      this.endDate,
      this.nEndDate,
      this.isPrivate,
      this.anonymousPlanTypeDetailForms,
      this.students,
      this.dayTerms});

  AnonymousPlantypeFormVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    coachId = json['coachId'];
    coachFullName = json['coachFullName'];
    title = json['title'];
    description = json['description'];
    totalPrice = json['totalPrice'];
    totalTerm = json['totalTerm'];
    dayCount = json['dayCount'];
    startDate = json['startDate'];
    nStartDate = json['nStartDate'];
    endDate = json['endDate'];
    nEndDate = json['nEndDate'];
    isPrivate = json['isPrivate'];
    if (json['anonymousPlanTypeDetailForms'] != null) {
      anonymousPlanTypeDetailForms = [];
      json['anonymousPlanTypeDetailForms'].forEach((v) {
        anonymousPlanTypeDetailForms!
            .add(new AnonymousPlanTypeDetailFormVm.fromJson(v));
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
    data['dayCount'] = this.dayCount;
    // data['startDate'] = this.startDate;
    data['nStartDate'] = this.nStartDate;
    // data['endDate'] = this.endDate;
    data['nEndDate'] = this.nEndDate;
    data['isPrivate'] = this.isPrivate;
    if (this.anonymousPlanTypeDetailForms != null) {
      data['anonymousPlanTypeDetailForms'] =
          this.anonymousPlanTypeDetailForms!.map((v) => v.toJson()).toList();
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
