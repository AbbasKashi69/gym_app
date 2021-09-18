import 'package:flutter/cupertino.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class AnonymousPlanTypeDetailFormVm extends BaseViewModel {
  int? id;
  int? anonymousPlanTypeId;
  int? dayNumber;
  int? termNumber;
  int? displayOrder;
  String? title;
  String? description;
  TextEditingController? nameMovementController;
  TextEditingController? descriptionController;

  AnonymousPlanTypeDetailFormVm(
      {this.id = 0,
      this.anonymousPlanTypeId = 0,
      this.dayNumber,
      this.termNumber,
      this.displayOrder,
      this.title,
      this.descriptionController,
      this.nameMovementController,
      this.description});

  AnonymousPlanTypeDetailFormVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    anonymousPlanTypeId = json['anonymousPlanTypeId'];
    dayNumber = json['dayNumber'];
    termNumber = json['termNumber'];
    displayOrder = json['displayOrder'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['anonymousPlanTypeId'] = this.anonymousPlanTypeId;
    data['dayNumber'] = this.dayNumber;
    data['termNumber'] = this.termNumber;
    data['displayOrder'] = this.displayOrder;
    data['title'] = this.nameMovementController!.text;
    data['description'] = this.descriptionController!.text;
    return data;
  }
}
