
import 'package:gym_app/ViewModels/BaseViewModel.dart';

class ArticleRateVm extends BaseViewModel {


    int? id;
int? articleId;
int? userId;
double? rateValue;
String? nRateValue;
String? creationDate;
String? nCreationDate;




    ArticleRateVm(
    {
        this.id,

this.articleId,

this.userId,

this.rateValue,

this.nRateValue,

this.creationDate
this.nCreationDate

    });


    ArticleRateVm.fromJson(Map<String, dynamic> json) {
        
        json['id'];

json['articleId'];

json['userId'];

super.intToDouble(json['rateValue']);

json['nRateValue'];

json['creationDate'];

json['nCreationDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();

        data['id'] = this.id;

data['articleId'] = this.articleId;

data['userId'] = this.userId;

data['rateValue'] = this.rateValue;

data['nRateValue'] = this.nRateValue;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;


    }
}
