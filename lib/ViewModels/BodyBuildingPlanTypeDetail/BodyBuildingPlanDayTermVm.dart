import 'package:gym_app/ViewModels/BaseViewModel.dart';

class BodyBuildingPlanDayTermVm extends BaseViewModel {
  int? dayNumber;
  int? currentTerm;
  int? termsCount;

  BodyBuildingPlanDayTermVm(
      {this.dayNumber, this.currentTerm, this.termsCount});

  BodyBuildingPlanDayTermVm.fromJson(Map<String, dynamic> json) {
    dayNumber = json['dayNumber'];
    currentTerm = json['currentTerm'];
    termsCount = json['termsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dayNumber'] = this.dayNumber;
    data['currentTerm'] = this.currentTerm;
    data['termsCount'] = this.termsCount;
    return data;
  }
}
