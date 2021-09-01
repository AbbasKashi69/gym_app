import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/Home/home_page.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/ListApprentice/requests_page.dart';
import 'package:gym_app/screen/PersonalInfo/personal_info_page.dart';
import 'package:gym_app/screen/ProfileApprentice/profile_apprentice_page.dart';
import 'package:gym_app/screen/ProgramList/program_list_page.dart';
import 'package:gym_app/screen/Scan/scan_page.dart';
import 'package:gym_app/screen/createProgramBodySetting/create_program_body_setting_page.dart';
import 'package:gym_app/screen/observeProgramBody/observe_program_body_page.dart';
import 'package:gym_app/screen/observeProgramOtherSports/observe_other_sports_page.dart';
import 'package:gym_app/screen/profile_page/profile_page.dart';
import 'package:gym_app/screen/settings/setting_page.dart';
import 'package:gym_app/screen/subscription_page/subscription_page.dart';

class MyRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case ScanPage.routeName:
        return MaterialPageRoute(builder: (context) => ScanPage());
      case ListApprenticePage.routeName:
        return MaterialPageRoute(builder: (context) => ListApprenticePage());
      case RequestsPage.routeName:
        return MaterialPageRoute(builder: (context) => RequestsPage());
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => HomePage());
      case SubscriptionPage.routeName:
        return MaterialPageRoute(builder: (context) => SubscriptionPage());
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      case ProfileApprenticePage.routeName:
        return MaterialPageRoute(builder: (context) => ProfileApprenticePage());
      case CvPage.routeName:
        return MaterialPageRoute(builder: (context) => CvPage());
      case PersonalInfoPage.routeName:
        return MaterialPageRoute(builder: (context) => PersonalInfoPage());
      case SettingPage.routeName:
        return MaterialPageRoute(builder: (context) => SettingPage());
      case CreateProgramBodyPage.routeName:
        return MaterialPageRoute(builder: (context) => CreateProgramBodyPage());
      case CreateMovement.routeName:
        return MaterialPageRoute(builder: (context) => CreateMovement());
      case ProgramListPage.routeName:
        return MaterialPageRoute(builder: (context) => ProgramListPage());
      case CreateProgramBodySettingPage.routeName:
        return MaterialPageRoute(
            builder: (context) => CreateProgramBodySettingPage());
      case ObseveProgramBody.routeName:
        return MaterialPageRoute(builder: (context) => ObseveProgramBody());
      case ObserveOtherSportsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => ObserveOtherSportsPage());
      default:
        return MaterialPageRoute(builder: (context) => ScanPage());
    }
  }
}
