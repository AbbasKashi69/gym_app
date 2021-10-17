import 'package:flutter/cupertino.dart';
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class BodyBuildingPlanTypeDetailsFormVm extends BaseViewModel {
  int? id;
  int? parentId;
  int? bodyBuildingPlanTypeId;
  int? dayNumber;
  int? termNumber;
  int? displayOrder;
  String? title;
  String? description;
  int? setCount;
  String? setDescription;
  List<int>? setItems;
  List<BodyBuildingPlanTypeDetailsFormVm>? superMoves;
  TextEditingController? nameMovementController;
  TextEditingController? descriptionController;
  TextEditingController? setController;
  List<TextEditingController>? listSetItemsTextController;

  BodyBuildingPlanTypeDetailsFormVm(
      {this.id = 0,
      this.parentId = 0,
      this.bodyBuildingPlanTypeId = 0,
      this.dayNumber,
      this.termNumber,
      this.displayOrder,
      this.title,
      this.description,
      this.setCount,
      this.setDescription,
      this.setItems,
      this.superMoves,
      this.setController,
      this.descriptionController,
      this.nameMovementController,
      this.listSetItemsTextController});

  BodyBuildingPlanTypeDetailsFormVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parentId'];
    bodyBuildingPlanTypeId = json['bodyBuildingPlanTypeId'];
    dayNumber = json['dayNumber'];
    termNumber = json['termNumber'];
    displayOrder = json['displayOrder'];
    nameMovementController = TextEditingController();
    descriptionController = TextEditingController();
    setController = TextEditingController();
    title = nameMovementController!.text = json['title'];
    description = descriptionController!.text = json['description'];
    setCount = json['setCount'];
    setController!.text = json['setCount'].toString();
    setDescription = json['setDescription'];
    setItems = json['setItems'].cast<int>();
    if (json['setItems'] != null) {
      listSetItemsTextController = [];
      json['setItems'].forEach((v) => listSetItemsTextController!
          .add(TextEditingController()..text = v.toString()));
    }
    if (json['superMoves'] != null) {
      superMoves = [];
      json['superMoves'].forEach((v) =>
          superMoves!.add(BodyBuildingPlanTypeDetailsFormVm.fromJson(v)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentId'] = this.parentId;
    data['bodyBuildingPlanTypeId'] = this.bodyBuildingPlanTypeId;
    data['dayNumber'] = this.dayNumber;
    data['termNumber'] = this.termNumber;
    data['displayOrder'] = this.displayOrder;
    data['title'] = this.nameMovementController!.text;
    data['description'] = this.descriptionController!.text;
    data['setCount'] = this.setController!.text;
    data['setDescription'] = this.setDescription;
    data['setItems'] =
        this.listSetItemsTextController!.map((e) => e.text).toList();
    if (this.superMoves != null) {
      data['superMoves'] = this.superMoves!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
