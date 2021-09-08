

import '../BaseViewModel.dart';

class PersonVm extends BaseViewModel {


    int? id;
String? firstName;
String? lastName;
String? birthDate;
String? nBirthDate;
String? nationalCode;
String? postalCode;
String? wardrobeNumber;
String? registeryDate;
String? nRegisteryDate;
String? pic;
String? telphone;
int? genderType;
String? nGenderType;




    PersonVm(
    {
        this.id, 
this.firstName, 
this.lastName, 
this.birthDate, 
this.nBirthDate, 
this.nationalCode, 
this.postalCode, 
this.wardrobeNumber, 
this.registeryDate, 
this.nRegisteryDate, 
this.pic, 
this.telphone, 
this.genderType, 
this.nGenderType, 

    });


    PersonVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

firstName = json['firstName'];

lastName = json['lastName'];

birthDate = json['birthDate'];

nBirthDate = json['nBirthDate'];

nationalCode = json['nationalCode'];

postalCode = json['postalCode'];

wardrobeNumber = json['wardrobeNumber'];

registeryDate = json['registeryDate'];

nRegisteryDate = json['nRegisteryDate'];

pic = json['pic'];

telphone = json['telphone'];

genderType = json['genderType'];

nGenderType = json['nGenderType'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['firstName'] = this.firstName;

data['lastName'] = this.lastName;

data['birthDate'] = this.birthDate;

data['nBirthDate'] = this.nBirthDate;

data['nationalCode'] = this.nationalCode;

data['postalCode'] = this.postalCode;

data['wardrobeNumber'] = this.wardrobeNumber;

data['registeryDate'] = this.registeryDate;

data['nRegisteryDate'] = this.nRegisteryDate;

data['pic'] = this.pic;

data['telphone'] = this.telphone;

data['genderType'] = this.genderType;

data['nGenderType'] = this.nGenderType;




        return data;
    }
}
