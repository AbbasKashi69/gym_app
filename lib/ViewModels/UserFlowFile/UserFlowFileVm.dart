
import 'package:gym_app/ViewModels/BaseViewModel.dart';

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
? file;




    UserFlowFileVm(
    {
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

this.file

    });


    UserFlowFileVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['userFlowId'];

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


    }
}
