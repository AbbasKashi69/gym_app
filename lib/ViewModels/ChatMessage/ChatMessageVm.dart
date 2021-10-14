import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ChatMessageVm extends BaseViewModel {
  late int id;
  late int senderId;
  late int roomChatId;
  late String textMessage;
  String? filePath;
  String? seenDateTime;
  late String nSeenDateTime;
  int? parentId;
  String? creationDate;
  String? nCreationDate;
  late int countNotSeen;
  late String titel;
  String? pic;
  late String nCreationTime;
  late bool? isMe;
  late bool? isSee;

  ChatMessageVm(
      {this.id = 0,
      required this.senderId,
      required this.roomChatId,
      required this.textMessage,
      this.filePath,
      this.seenDateTime,
      required this.nSeenDateTime,
      this.parentId,
      this.creationDate,
      this.nCreationDate,
      required this.countNotSeen,
      required this.titel,
      this.pic,
      required this.nCreationTime,
      required this.isMe,
      required this.isSee});

  ChatMessageVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['senderId'];
    roomChatId = json['roomChatId'];
    textMessage = json['textMessage'];
    filePath = json['filePath'];
    seenDateTime = json['seenDateTime'];
    nSeenDateTime = json['nSeenDateTime'];
    parentId = json['parentId'];
    creationDate = json['creationDate'];
    nCreationDate = json['nCreationDate'];
    countNotSeen = json['countNotSeen'];
    titel = json['titel'];
    pic = json['pic'];
    nCreationTime = json['nCreationTime'];
    isMe = json['isME'];
    isSee = json['isSee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['senderId'] = this.senderId;
    data['roomChatId'] = this.roomChatId;
    data['textMessage'] = this.textMessage;
    data['filePath'] = this.filePath;
    data['seenDateTime'] = this.seenDateTime;
    data['nSeenDateTime'] = this.nSeenDateTime;
    data['parentId'] = this.parentId;
    data['creationDate'] = this.creationDate;
    data['nCreationDate'] = this.nCreationDate;
    data['countNotSeen'] = this.countNotSeen;
    data['titel'] = this.titel;
    data['pic'] = this.pic;
    data['nCreationTime'] = this.nCreationTime;
    data['isMe'] = this.isMe;
    data['isSee'] = this.isSee;
    return data;
  }
}
