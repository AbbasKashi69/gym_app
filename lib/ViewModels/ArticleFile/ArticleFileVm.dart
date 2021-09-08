
import 'package:gym_app/ViewModels/BaseViewModel.dart';

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
? file;
String? oldPath;




    ArticleFileVm(
    {
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

this.oldPath

    });


    ArticleFileVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['articleId'];

json['title'];

json['description'];

json['fileType'];

json['nFileType'];

json['fileFormat'];

json['path'];

json['fileSize'];

json['fileName'];

json['creationDate'];

json['nCreationDate'];

json['displayOrder'];

json['file'];

json['oldPath'];


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


    }
}
