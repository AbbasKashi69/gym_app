
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class PublicChatMessageVm extends BaseViewModel {


    int? id;
int? senderId;
String? textMessage;
String? filePath;
String? seenDateTime;
String? nSeenDateTime;
int? parentId;
String? creationDate;
String? nCreationDate;
? sender;
? publicChatMessage1;




    PublicChatMessageVm(
    {
        this.id,

this.senderId,

this.textMessage,

this.filePath,

this.seenDateTime,

this.nSeenDateTime,

this.parentId,

this.creationDate,

this.nCreationDate,

this.sender,

this.publicChatMessage1

    });


    PublicChatMessageVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['senderId'];

json['textMessage'];

json['filePath'];

json['seenDateTime'];

json['nSeenDateTime'];

json['parentId'];

json['creationDate'];

json['nCreationDate'];

json['sender'];

json['publicChatMessage1'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['senderId'] = this.senderId;

data['textMessage'] = this.textMessage;

data['filePath'] = this.filePath;

data['seenDateTime'] = this.seenDateTime;

data['nSeenDateTime'] = this.nSeenDateTime;

data['parentId'] = this.parentId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['sender'] = this.sender;

data['publicChatMessage1'] = this.publicChatMessage1;


    }
}
