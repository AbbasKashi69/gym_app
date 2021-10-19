import 'package:flutter/cupertino.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class DietPlanTypeDetailFormVm extends BaseViewModel {
  int? id;
  int? dietPlanTypeId;
  int? dayNumber;
  int? mealNumber;
  int? displayOrder;
  String? title;
  String? description;
  TextEditingController? nameDietController;
  TextEditingController? descriptionController;

  DietPlanTypeDetailFormVm(
      {this.id = 0,
      this.dietPlanTypeId = 0,
      this.dayNumber,
      this.mealNumber,
      this.displayOrder,
      this.title,
      this.descriptionController,
      this.nameDietController,
      this.description});

  DietPlanTypeDetailFormVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dietPlanTypeId = json['dietPlanTypeId'];
    dayNumber = json['dayNumber'];
    mealNumber = json['mealNumber'];
    displayOrder = json['displayOrder'];
    nameDietController = TextEditingController();
    descriptionController = TextEditingController();
    title = nameDietController!.text = json['title'];
    description = descriptionController!.text = json['description'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dietPlanTypeId'] = this.dietPlanTypeId;
    data['dayNumber'] = this.dayNumber;
    data['mealNumber'] = this.mealNumber;
    data['displayOrder'] = this.displayOrder;
    data['title'] = this.nameDietController!.text;
    data['description'] = this.descriptionController!.text;
    return data;
  }
}
