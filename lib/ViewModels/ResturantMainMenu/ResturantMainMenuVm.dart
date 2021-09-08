
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ResturantMainMenuVm extends BaseViewModel {


    int? id;
int? foodId;
String? creationDate;
String? nCreationDate;




    ResturantMainMenuVm(
    {
        this.id,

this.foodId,

this.creationDate
this.nCreationDate

    });


    ResturantMainMenuVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['foodId'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['foodId'] = this.foodId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
