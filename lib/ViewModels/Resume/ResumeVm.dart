
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ResumeVm extends BaseViewModel {


    int? id;
int? userId;
int? age;
String? instagram;
String? telegram;
String? description;
String? creationDate;
String? nCreationDate;




    ResumeVm(
    {
        this.id,

this.userId,

this.age,

this.instagram,

this.telegram,

this.description,

this.creationDate
this.nCreationDate

    });


    ResumeVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['userId'];

json['age'];

json['instagram'];

json['telegram'];

json['description'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['userId'] = this.userId;

data['age'] = this.age;

data['instagram'] = this.instagram;

data['telegram'] = this.telegram;

data['description'] = this.description;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
