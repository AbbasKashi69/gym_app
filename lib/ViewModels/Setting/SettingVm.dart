
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class SettingVm extends BaseViewModel {


    int? id;
int? type;
String? nType;
String? title;
String? description;
String? pic;
int? adminId;
String? creationDate;
String? nCreationDate;




    SettingVm(
    {
        this.id,

this.type,

this.nType,

this.title,

this.description,

this.pic,

this.adminId,

this.creationDate
this.nCreationDate

    });


    SettingVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['type'];

json['nType'];

json['title'];

json['description'];

json['pic'];

json['adminId'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['type'] = this.type;

data['nType'] = this.nType;

data['title'] = this.title;

data['description'] = this.description;

data['pic'] = this.pic;

data['adminId'] = this.adminId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
