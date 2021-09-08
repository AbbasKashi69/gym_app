
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ChatMessageVm extends BaseViewModel {


    int? id;
int? senderId;
int? receiverId;
String? textMessage;
String? filePath;
String? seenDateTime;
String? nSeenDateTime;
int? parentId;
String? creationDate;
String? nCreationDate;
? chatMessage1;
? sender;
? receiver;




    ChatMessageVm(
    {
        this.id,

this.senderId,

this.receiverId,

this.textMessage,

this.filePath,

this.seenDateTime,

this.nSeenDateTime,

this.parentId,

this.creationDate,

this.nCreationDate,

this.chatMessage1,

this.sender,

this.receiver

    });


    ChatMessageVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['senderId'];

json['receiverId'];

json['textMessage'];

json['filePath'];

json['seenDateTime'];

json['nSeenDateTime'];

json['parentId'];

json['creationDate'];

json['nCreationDate'];

json['chatMessage1'];

json['sender'];

json['receiver'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['senderId'] = this.senderId;

data['receiverId'] = this.receiverId;

data['textMessage'] = this.textMessage;

data['filePath'] = this.filePath;

data['seenDateTime'] = this.seenDateTime;

data['nSeenDateTime'] = this.nSeenDateTime;

data['parentId'] = this.parentId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['chatMessage1'] = this.chatMessage1;

data['sender'] = this.sender;

data['receiver'] = this.receiver;


    }
}
