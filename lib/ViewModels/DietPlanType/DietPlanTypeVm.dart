
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class DietPlanTypeVm extends BaseViewModel {


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




    DietPlanTypeVm(
    {
        this.id,

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

this.dayCount

    });


    DietPlanTypeVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['coachId'];

json['title'];

json['description'];

json['isActive'];

json['creationDate'];

json['nCreationDate'];

super.intToDouble(json['totalPrice']);

json['nTotalPrice'];

super.intToDouble(json['totalTerm']);

json['nTotalTerm'];

json['dayCount'];


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


    }
}
