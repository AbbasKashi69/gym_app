import 'package:gym_app/Repositories/BaseRepository.dart';

class BaseViewModel {
  static String baseUrl = BaseRepository.baseUrl + "/Uploads/";

  String createPath(dynamic path) {
    if (path == null) {
      return '';
    }
    return baseUrl + path.toString();
  }

  String nullToString(dynamic property) {
    if (property == null) {
      return ' ';
    }
    return property.toString();
  }
  // int nullToInt(dynamic property)
  // {
  //   if(property == null)
  //   {
  //     return -1;
  //   }
  //   return property;
  // }

  double intToDouble(dynamic property) {
    if (property == null || property == 0) return 0.0;
    return double.parse(property.toString());
  }
}
