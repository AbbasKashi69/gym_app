import 'package:gym_app/ViewModels/BaseViewModel.dart';

class DietPlanTypeDayMealVm extends BaseViewModel {
  int? dayNumber;
  int? currentTerm;
  int? mealsCount;

  DietPlanTypeDayMealVm({this.dayNumber, this.currentTerm, this.mealsCount});

  DietPlanTypeDayMealVm.fromJson(Map<String, dynamic> json) {
    dayNumber = json['dayNumber'];
    currentTerm = json['currentTerm'];
    mealsCount = json['mealsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dayNumber'] = this.dayNumber;
    data['currentTerm'] = this.currentTerm;
    data['mealsCount'] = this.mealsCount;
    return data;
  }
}
