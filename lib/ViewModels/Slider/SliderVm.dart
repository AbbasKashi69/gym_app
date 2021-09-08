
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class SliderVm extends BaseViewModel {


    int? id;
int? adminId;
String? title;
String? description;
String? link;
String? pic;
bool? isActive;
String? creationDate;
String? nCreationDate;
String? startDate;
String? nStartDate;
String? endDate;
String? nEndDate;




    SliderVm(
    {
        this.id,

this.adminId,

this.title,

this.description,

this.link,

this.pic,

this.isActive,

this.creationDate,

this.nCreationDate,

this.startDate,

this.nStartDate,

this.endDate
this.nEndDate

    });


    SliderVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['adminId'];

json['title'];

json['description'];

json['link'];

json['pic'];

json['isActive'];

json['creationDate'];

json['nCreationDate'];

json['startDate'];

json['nStartDate'];

json['endDate'];

json['nEndDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['adminId'] = this.adminId;

data['title'] = this.title;

data['description'] = this.description;

data['link'] = this.link;

data['pic'] = this.pic;

data['isActive'] = this.isActive;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['startDate'] = this.startDate;

data['nStartDate'] = this.nStartDate;

data['endDate'] = this.endDate;

data['nEndDate'] = this.nEndDate;


    }
}
