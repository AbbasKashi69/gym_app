
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ArticleCommentVm extends BaseViewModel {


    int? id;
int? articleId;
int? userId;
int? parentId;
String? userFullName;
String? text;
bool? isActive;
String? creationDate;
String? nCreationDate;




    ArticleCommentVm(
    {
        this.id,

this.articleId,

this.userId,

this.parentId,

this.userFullName,

this.text,

this.isActive,

this.creationDate
this.nCreationDate

    });


    ArticleCommentVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['articleId'];

json['userId'];

json['parentId'];

json['userFullName'];

json['text'];

json['isActive'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['articleId'] = this.articleId;

data['userId'] = this.userId;

data['parentId'] = this.parentId;

data['userFullName'] = this.userFullName;

data['text'] = this.text;

data['isActive'] = this.isActive;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
