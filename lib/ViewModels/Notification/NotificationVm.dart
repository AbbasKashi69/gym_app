

import '../BaseViewModel.dart';

class NotificationVm extends BaseViewModel {


    int? id;
int? userId;
int? resturantInvoiceId;
int? chatMessageId;
int? subscriptionTypeInvoiceId;
int? walletLogId;
int? bodyBuildingTypeLogId;
int? dietPlanTypeLogId;
int? anonymousTypePlanLogId;
String? title;
String? description;
bool? isActive;
String? creationDate;
String? nCreationDate;
String? seenDate;
String? nSeenDate;




    NotificationVm(
    {
        this.id, 
this.userId, 
this.resturantInvoiceId, 
this.chatMessageId, 
this.subscriptionTypeInvoiceId, 
this.walletLogId, 
this.bodyBuildingTypeLogId, 
this.dietPlanTypeLogId, 
this.anonymousTypePlanLogId, 
this.title, 
this.description, 
this.isActive, 
this.creationDate, 
this.nCreationDate, 
this.seenDate, 
this.nSeenDate, 

    });


    NotificationVm.fromJson(Map<String, dynamic> json) {
        
        id = json['id'];

userId = json['userId'];

resturantInvoiceId = json['resturantInvoiceId'];

chatMessageId = json['chatMessageId'];

subscriptionTypeInvoiceId = json['subscriptionTypeInvoiceId'];

walletLogId = json['walletLogId'];

bodyBuildingTypeLogId = json['bodyBuildingTypeLogId'];

dietPlanTypeLogId = json['dietPlanTypeLogId'];

anonymousTypePlanLogId = json['anonymousTypePlanLogId'];

title = json['title'];

description = json['description'];

isActive = json['isActive'];

creationDate = json['creationDate'];

nCreationDate = json['nCreationDate'];

seenDate = json['seenDate'];

nSeenDate = json['nSeenDate'];


    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();


        data['id'] = this.id;

data['userId'] = this.userId;

data['resturantInvoiceId'] = this.resturantInvoiceId;

data['chatMessageId'] = this.chatMessageId;

data['subscriptionTypeInvoiceId'] = this.subscriptionTypeInvoiceId;

data['walletLogId'] = this.walletLogId;

data['bodyBuildingTypeLogId'] = this.bodyBuildingTypeLogId;

data['dietPlanTypeLogId'] = this.dietPlanTypeLogId;

data['anonymousTypePlanLogId'] = this.anonymousTypePlanLogId;

data['title'] = this.title;

data['description'] = this.description;

data['isActive'] = this.isActive;

data['creationDate'] = this.creationDate;

data['nCreationDate'] = this.nCreationDate;

data['seenDate'] = this.seenDate;

data['nSeenDate'] = this.nSeenDate;




        return data;
    }
}
