
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class DietPlanTypeDetailVm extends BaseViewModel {


    int? id;
int? dietPlanTypeId;
int? dayNumber;
int? mealNumber;
int? displayOrder;
String? title;
String? description;
String? creationDate;
String? nCreationDate;




    DietPlanTypeDetailVm(
    {
        this.id,

this.dietPlanTypeId,

this.dayNumber,

this.mealNumber,

this.displayOrder,

this.title,

this.description,

this.creationDate
this.nCreationDate

    });


    DietPlanTypeDetailVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['dietPlanTypeId'];

json['dayNumber'];

json['mealNumber'];

json['displayOrder'];

json['title'];

json['description'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['dietPlanTypeId'] = this.dietPlanTypeId;

data['dayNumber'] = this.dayNumber;

data['mealNumber'] = this.mealNumber;

data['displayOrder'] = this.displayOrder;

data['title'] = this.title;

data['description'] = this.description;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
