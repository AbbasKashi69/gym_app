import '../BaseViewModel.dart';

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

  ChatMessageVm({
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
  });

  ChatMessageVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    senderId = json['senderId'];

    receiverId = json['receiverId'];

    textMessage = json['textMessage'];

    filePath = json['filePath'];

    seenDateTime = json['seenDateTime'];

    nSeenDateTime = json['nSeenDateTime'];

    parentId = json['parentId'];

    creationDate = json['creationDate'];

    nCreationDate = json['nCreationDate'];
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

    return data;
  }
}
