import '../BaseViewModel.dart';

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

  PublicChatMessageVm({
    this.id,
    this.senderId,
    this.textMessage,
    this.filePath,
    this.seenDateTime,
    this.nSeenDateTime,
    this.parentId,
    this.creationDate,
    this.nCreationDate,
  });

  PublicChatMessageVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    senderId = json['senderId'];

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
