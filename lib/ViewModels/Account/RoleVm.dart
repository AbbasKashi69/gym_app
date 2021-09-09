import 'package:gym_app/ViewModels/BaseViewModel.dart';

class RoleVm extends BaseViewModel {
  String? name;
  String? normalizedName;
  int? roleType;
  List<int>? hasAcces;
  String? confirmPassword;
  bool? isSelected;
  String? nRoleType;
  int? id;

  RoleVm(e,
      {this.name,
      this.normalizedName,
      this.roleType,
      this.hasAcces,
      this.confirmPassword,
      this.isSelected,
      this.nRoleType,
      this.id});

  RoleVm.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    normalizedName = json['normalizedName'];
    roleType = json['RoleType'];
    hasAcces = json['hasAcces'].cast<int>();
    confirmPassword = json['confirmPassword'];
    isSelected = json['isSelected'];
    nRoleType = json['nRoleType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['normalizedName'] = this.normalizedName;
    data['RoleType'] = this.roleType;
    data['hasAcces'] = this.hasAcces;
    data['confirmPassword'] = this.confirmPassword;
    data['isSelected'] = this.isSelected;
    data['nRoleType'] = this.nRoleType;
    data['id'] = this.id;
    return data;
  }
}
