
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class UserFlowVm extends BaseViewModel {


    int? id;
int? userId;
String? weight;
String? description;




    UserFlowVm(
    {
        this.id,

this.userId,

this.weight,

this.description

    });


    UserFlowVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['userId'];

json['weight'];

json['description'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['userId'] = this.userId;

data['weight'] = this.weight;

data['description'] = this.description;


    }
}
