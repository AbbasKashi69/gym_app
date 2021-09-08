

import '../BaseViewModel.dart';

class CheckInCheckOutVm extends BaseViewModel {


    int? id;
int? userId;
bool? isCheckIn;
String? creationDate;
String? nCreationDate;
int? checkType;
String? nCheckType;




    CheckInCheckOutVm(
    {
        this.id, 
this.userId, 
this.isCheckIn, 
this.creationDate, 
this.nCreationDate, 
this.checkType, 
this.nCheckType, 

    });


    CheckInCheckOutVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

isCheckIn = json['isCheckIn'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

checkType = json['checkType'];

nCheckType = json['nCheckType'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['isCheckIn'] = this.isCheckIn;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['checkType'] = this.checkType;

data['nCheckType'] = this.nCheckType;




        return data;
    }
}
