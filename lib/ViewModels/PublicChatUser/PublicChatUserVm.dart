

import '../BaseViewModel.dart';

class PublicChatUserVm extends BaseViewModel {


    int? id;
int? publicChatMessageId;
int? roleId;
String? creationDate;
String? nCreationDate;




    PublicChatUserVm(
    {
        this.id, 
this.publicChatMessageId, 
this.roleId, 
this.creationDate, 
this.nCreationDate, 

    });


    PublicChatUserVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

publicChatMessageId = json['publicChatMessageId'];

roleId = json['roleId'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['publicChatMessageId'] = this.publicChatMessageId;

data['roleId'] = this.roleId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
