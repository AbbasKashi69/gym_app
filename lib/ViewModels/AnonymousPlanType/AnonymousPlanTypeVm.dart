import '../BaseViewModel.dart';

class AnonymousPlanTypeVm extends BaseViewModel {
  int? id;
  int? coachId;
  String? title;
  String? description;
  bool? isActive;
  String? creationDate;
  String? nCreationDate;
  double? totalPrice;
  String? nTotalPrice;
  double? totalTerm;
  String? nTotalTerm;
  int? dayCount;

  AnonymousPlanTypeVm(
      {this.id,
      this.coachId,
      this.title,
      this.description,
      this.isActive,
      this.creationDate,
      this.nCreationDate,
      this.totalPrice,
      this.nTotalPrice,
      this.totalTerm,
      this.nTotalTerm,
      this.dayCount});

  AnonymousPlanTypeVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    coachId = json['coachId'];

    title = json['title'];

    description = json['description'];

    isActive = json['isActive'];

    creationDate = json['creationDate'];

    nCreationDate = json['nCreationDate'];

    super.intToDouble(json['totalPrice']);

    nTotalPrice = json['nTotalPrice'];

    super.intToDouble(json['totalTerm']);

    nTotalTerm = json['nTotalTerm'];

    dayCount = json['dayCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    data['coachId'] = this.coachId;

    data['title'] = this.title;

    data['description'] = this.description;

    data['isActive'] = this.isActive;

    data['creationDate'] = this.creationDate;

    data['nCreationDate'] = this.nCreationDate;

    data['totalPrice'] = this.totalPrice;

    data['nTotalPrice'] = this.nTotalPrice;

    data['totalTerm'] = this.totalTerm;

    data['nTotalTerm'] = this.nTotalTerm;

    data['dayCount'] = this.dayCount;
    return data;
  }
}
