import '../BaseViewModel.dart';

class UserFlowFileVm extends BaseViewModel {
  int? id;
  int? userFlowId;
  String? title;
  String? description;
  int? fileType;
  String? nFileType;
  String? fileFormat;
  String? path;
  int? fileSize;
  String? fileName;
  String? creationDate;
  String? nCreationDate;
  int? displayOrder;
  String? file;

  UserFlowFileVm({
    this.id,
    this.userFlowId,
    this.title,
    this.description,
    this.fileType,
    this.nFileType,
    this.fileFormat,
    this.path,
    this.fileSize,
    this.fileName,
    this.creationDate,
    this.nCreationDate,
    this.displayOrder,
    this.file,
  });

  UserFlowFileVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    userFlowId = json['userFlowId'];

    title = json['title'];

    description = json['description'];

    fileType = json['fileType'];

    nFileType = json['nFileType'];

    fileFormat = json['fileFormat'];

    path = json['path'];

    fileSize = json['fileSize'];

    fileName = json['fileName'];

    creationDate = json['creationDate'];

    nCreationDate = json['nCreationDate'];

    displayOrder = json['displayOrder'];

    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    data['userFlowId'] = this.userFlowId;

    data['title'] = this.title;

    data['description'] = this.description;

    data['fileType'] = this.fileType;

    data['nFileType'] = this.nFileType;

    data['fileFormat'] = this.fileFormat;

    data['path'] = this.path;

    data['fileSize'] = this.fileSize;

    data['fileName'] = this.fileName;

    data['creationDate'] = this.creationDate;

    data['nCreationDate'] = this.nCreationDate;

    data['displayOrder'] = this.displayOrder;

    data['file'] = this.file;

    return data;
  }
}
