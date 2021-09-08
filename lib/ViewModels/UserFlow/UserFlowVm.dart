

import '../BaseViewModel.dart';

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
this.description, 

    });


    UserFlowVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

weight = json['weight'];

description = json['description'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['weight'] = this.weight;

data['description'] = this.description;




        return data;
    }
}
