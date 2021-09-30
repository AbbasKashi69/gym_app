import 'package:gym_app/Services/LocalSavingService.dart';
import 'package:gym_app/ViewModels/TokenResponseVm.dart';

class CurrentUserVm {
  static int? userId = -1;
  static String? userName = '';
  static String? token = '';
  static String? creationDate = '';
  static String? nCreationDate = '';
  static String? currentVersion = "2.0.2";
  static int? roleType = 0;

  static LocalSavingService? localSavingService;

  CurrentUserVm.from(TokenResponseVm token) {
    CurrentUserVm.token = token.token;
    CurrentUserVm.creationDate = token.creationDate;
    CurrentUserVm.userId = token.userId;
    CurrentUserVm.userName = token.userName;
    CurrentUserVm.nCreationDate = token.nCreationDate;
  }

  CurrentUserVm.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    creationDate = json['creationDate'];
    userId = json['userId'];
    userName = json['userName'];
    nCreationDate = json['nCreationDate'];
  }

  static Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = token;
    data['creationDate'] = creationDate;
    data['userId'] = userId;
    data['userName'] = userName;
    data['nCreationDate'] = nCreationDate;
    return data;
  }
}
