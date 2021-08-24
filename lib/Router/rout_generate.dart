import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/ListApprentice/requests_page.dart';
import 'package:gym_app/screen/ProfileApprentice/profile_apprentice_page.dart';
import 'package:gym_app/screen/Scan/scan_page.dart';

class MyRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ScanPage.routeName:
        return MaterialPageRoute(builder: (context) => ScanPage());
      case ListApprenticePage.routeName:
        return MaterialPageRoute(builder: (context) => ListApprenticePage());
      case RequestsPage.routeName:
        return MaterialPageRoute(builder: (context) => RequestsPage());
      case ProfileApprenticePage.routeName:
        return MaterialPageRoute(builder: (context) => ProfileApprenticePage());
      case CvPage.routeName:
        return MaterialPageRoute(builder: (context) => CvPage());
      default:
        return MaterialPageRoute(builder: (context) => ScanPage());
    }
  }
}
