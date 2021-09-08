import '../BaseViewModel.dart';

class AnonymousPlanTypeDetailVm extends BaseViewModel {
  int? id;
  int? anonymousPlanTypeId;
  int? dayNumber;
  int? termNumber;
  int? displayOrder;
  String? title;
  String? description;
  String? creationDate;
  String? nCreationDate;

  AnonymousPlanTypeDetailVm(
      {this.id,
      this.anonymousPlanTypeId,
      this.dayNumber,
      this.termNumber,
      this.displayOrder,
      this.title,
      this.description,
      this.creationDate,
      this.nCreationDate});

  AnonymousPlanTypeDetailVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    anonymousPlanTypeId = json['anonymousPlanTypeId'];

    dayNumber = json['dayNumber'];

    termNumber = json['termNumber'];

    displayOrder = json['displayOrder'];

    title = json['title'];

    description = json['description'];

    creationDate = json['creationDate'];

    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    data['anonymousPlanTypeId'] = this.anonymousPlanTypeId;

    data['dayNumber'] = this.dayNumber;

    data['termNumber'] = this.termNumber;

    data['displayOrder'] = this.displayOrder;

    data['title'] = this.title;

    data['description'] = this.description;

    data['creationDate'] = this.creationDate;

    data['nCreationDate'] = this.nCreationDate;
    return data;
  }
}
