import 'package:gym_app/ViewModels/BaseViewModel.dart';

class PersonListVm extends BaseViewModel {
  int? id;
  String? firstName;
  String? lastName;
  String? userFullName;
  String? pic;

  PersonListVm(
      {this.id, this.firstName, this.lastName, this.userFullName, this.pic});

  PersonListVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userFullName = json['userFullName'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userFullName'] = this.userFullName;
    data['pic'] = this.pic;
    return data;
  }
}
