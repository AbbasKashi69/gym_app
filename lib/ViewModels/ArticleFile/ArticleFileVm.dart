import '../BaseViewModel.dart';

class ArticleFileVm extends BaseViewModel {
  int? id;
  int? articleId;
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
  String? oldPath;

  ArticleFileVm({
    this.id,
    this.articleId,
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
    this.oldPath,
  });

  ArticleFileVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    articleId = json['articleId'];

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

    oldPath = json['oldPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;

    data['articleId'] = this.articleId;

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

    data['oldPath'] = this.oldPath;

    return data;
  }
}
