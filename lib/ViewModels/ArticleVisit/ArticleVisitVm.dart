

import '../BaseViewModel.dart';

class ArticleVisitVm extends BaseViewModel {


    int? id;
int? articleId;
int? userId;
String? creationDate;
String? nCreationDate;




    ArticleVisitVm(
    {
        this.id, 
this.articleId, 
this.userId, 
this.creationDate, 
this.nCreationDate, 

    });


    ArticleVisitVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

articleId = json['articleId'];

userId = json['userId'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['articleId'] = this.articleId;

data['userId'] = this.userId;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;




        return data;
    }
}
