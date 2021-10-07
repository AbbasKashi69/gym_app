import 'package:gym_app/ViewModels/BaseViewModel.dart';

class UserFlowChartVm extends BaseViewModel {
  int? id;
  int? userId;
  int? coachId;
  double? weight;
  double? height;
  double? bmi;
  String? nWeight;
  String? nHeight;
  String? nBmi;
  String? creationDate;
  String? nCreationDate;

  UserFlowChartVm(
      {this.id,
      this.userId,
      this.coachId,
      this.weight,
      this.height,
      this.bmi,
      this.nWeight,
      this.nHeight,
      this.nBmi,
      this.creationDate,
      this.nCreationDate});

  UserFlowChartVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    coachId = json['coachId'];
    weight = super.intToDouble(json['weight']);
    height = super.intToDouble(json['height']);
    bmi = super.intToDouble(json['bmi']);
    nWeight = json['nWeight'];
    nHeight = json['nHeight'];
    nBmi = json['nBmi'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['coachId'] = this.coachId;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['bmi'] = this.bmi;
    data['nWeight'] = this.nWeight;
    data['nHeight'] = this.nHeight;
    data['nBmi'] = this.nBmi;
    data['creationDate'] = this.creationDate;
    data['nCreationDate'] = this.nCreationDate;
    return data;
  }
}
