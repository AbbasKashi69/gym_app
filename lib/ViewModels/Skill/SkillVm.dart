
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class SkillVm extends BaseViewModel {


    int? id;
int? adminId;
String? title;
String? description;




    SkillVm(
    {
        this.id,

this.adminId,

this.title,

this.description

    });


    SkillVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['adminId'];

json['title'];

json['description'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['adminId'] = this.adminId;

data['title'] = this.title;

data['description'] = this.description;


    }
}
