

import '../BaseViewModel.dart';

class RelationVm extends BaseViewModel {


    int? id;
int? followerId;
int? followingId;
String? creationDate;
String? nCreationDate;




    RelationVm(
    {
        this.id, 
this.followerId, 
this.followingId, 
this.creationDate, 
this.nCreationDate, 

    });


    RelationVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

followerId = json['followerId'];

followingId = json['followingId'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['followerId'] = this.followerId;

data['followingId'] = this.followingId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
