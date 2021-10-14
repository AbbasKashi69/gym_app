import 'package:gym_app/ViewModels/DietPlanTypeDetail/DietPlanTypeDetailFormVm.dart';
import 'package:gym_app/ViewModels/Person/PersonListVm.dart';

import 'DietPlanTypeDayMealVm.dart';

class DietPlanTypeFormVm {
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
  List<DietPlanTypeDetailFormVm>? dietPlanTypeDetailForms;
  List<PersonListVm>? students;
  List<DietPlanTypeDayMealVm>? dayMeals;

  DietPlanTypeFormVm(
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
      this.dietPlanTypeDetailForms,
      this.students,
      this.dayMeals});

  DietPlanTypeFormVm.fromJson(Map<String, dynamic> json) {
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
    if (json['dietPlanTypeDetailForms'] != null) {
      dietPlanTypeDetailForms = [];
      json['dietPlanTypeDetailForms'].forEach((v) {
        dietPlanTypeDetailForms!.add(new DietPlanTypeDetailFormVm.fromJson(v));
      });
    }
    if (json['students'] != null) {
      students = [];
      json['students'].forEach((v) {
        students!.add(new PersonListVm.fromJson(v));
      });
    }
    if (json['dayMeals'] != null) {
      dayMeals = [];
      json['dayMeals'].forEach((v) {
        dayMeals!.add(new DietPlanTypeDayMealVm.fromJson(v));
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
    // data['dayCount'] = this.dayCount;
    // data['startDate'] = this.startDate;
    data['nStartDate'] = this.nStartDate;
    // data['endDate'] = this.endDate;
    data['nEndDate'] = this.nEndDate;
    data['isPrivate'] = this.isPrivate;
    if (this.dietPlanTypeDetailForms != null) {
      data['dietPlanTypeDetailForms'] =
          this.dietPlanTypeDetailForms!.map((v) => v.toJson()).toList();
    }
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    if (this.dayMeals != null) {
      data['dayMeals'] = this.dayMeals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
