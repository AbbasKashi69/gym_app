import 'package:gym_app/ViewModels/BaseViewModel.dart';

class UserWalletVm extends BaseViewModel {
  int? id;
  int? userId;
  String? userFullName;
  double? walletBallance;
  String? nWalletBallance;

  UserWalletVm(
      {this.id,
      this.userId,
      this.userFullName,
      this.walletBallance,
      this.nWalletBallance});

  UserWalletVm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    userFullName = json['userFullName'];
    walletBallance = super.intToDouble(json['walletBallance']);
    nWalletBallance = json['nWalletBallance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['userFullName'] = this.userFullName;
    data['walletBallance'] = this.walletBallance;
    data['nWalletBallance'] = this.nWalletBallance;
    return data;
  }
}
