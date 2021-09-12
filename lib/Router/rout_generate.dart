import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/blocs/BottomNav/bloc/bottom_nav_bloc.dart';
import 'package:gym_app/blocs/PlanType/bloc/get_plans_by_sort_bloc.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/DetailElan/detail_elan_page.dart';
import 'package:gym_app/screen/Elanha/elan_page.dart';
import 'package:gym_app/screen/Home/home_page.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/ListApprentice/requests_page.dart';
import 'package:gym_app/screen/ListCoach/list_coach_page.dart';
import 'package:gym_app/screen/PersonalInfo/personal_info_page.dart';
import 'package:gym_app/screen/PersonalInfoCoach/personal_info_coach_page.dart';
import 'package:gym_app/screen/ProfileApprentice/profile_apprentice_page.dart';
import 'package:gym_app/screen/ProfileCoach/profile_coach_page.dart';
import 'package:gym_app/screen/ProgramList/program_list_page.dart';
import 'package:gym_app/screen/Scan/scan_page.dart';
import 'package:gym_app/screen/createProgramBodySetting/create_program_body_setting_page.dart';
import 'package:gym_app/screen/observeProgramBody/observe_program_body_page.dart';
import 'package:gym_app/screen/observeProgramOtherSports/observe_other_sports_page.dart';
import 'package:gym_app/screen/chat/chat_list_page.dart';
import 'package:gym_app/screen/list_barnameha/list_barnameha.dart';
import 'package:gym_app/screen/profile_page/profile_page.dart';
import 'package:gym_app/screen/settings/setting_page.dart';
import 'package:gym_app/screen/subscription_page/subscription_page.dart';
import 'package:gym_app/screen/PersonalInfo/personal_info_page.dart';
import 'package:gym_app/screen/ProfileApprentice/profile_apprentice_page.dart';
import 'package:gym_app/screen/Scan/scan_page.dart';
import 'package:gym_app/screen/Wallet/wallet_page.dart';

class MyRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MyHomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) =>
                      BottomNavBloc()..add(BottomNavLoadingEvent(index: 0)),
                  child: MyHomePage(),
                ));
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
      case ProfileApprenticePage.routeName:
        return MaterialPageRoute(builder: (context) => ProfileApprenticePage());
      case WalletPage.routeName:
        return MaterialPageRoute(builder: (context) => WalletPage());
      case CvPage.routeName:
        return MaterialPageRoute(builder: (context) => CvPage());
      case PersonalInfoPage.routeName:
        return MaterialPageRoute(builder: (context) => PersonalInfoPage());
      case SettingPage.routeName:
        return MaterialPageRoute(builder: (context) => SettingPage());
      case CreateProgramBodyPage.routeName:
        return MaterialPageRoute(builder: (context) => CreateProgramBodyPage());
      case CreateMovementPage.routeName:
        return MaterialPageRoute(builder: (context) => CreateMovementPage());
      case ProgramListPage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => GetPlansBySortBloc()
                    ..add(GetPlansBySortLoadingEvent(planType: 1)),
                  child: ProgramListPage(),
                ));
      case CreateProgramBodySettingPage.routeName:
        return MaterialPageRoute(
            builder: (context) => CreateProgramBodySettingPage());
      case ObserveProgramBody.routeName:
        return MaterialPageRoute(builder: (context) => ObserveProgramBody());
      case ObserveOtherSportsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => ObserveOtherSportsPage());
      case ListCoachPage.routeName:
        return MaterialPageRoute(builder: (context) => ListCoachPage());
      case ProfileCoachPage.routeName:
        return MaterialPageRoute(builder: (context) => ProfileCoachPage());
      case PersonalInfoCoachPage.routeName:
        return MaterialPageRoute(builder: (context) => PersonalInfoCoachPage());
      case ListBarnamehaPage.routeName:
        return MaterialPageRoute(builder: (context) => ListBarnamehaPage());
      //******* new */
      case ElanPage.routeName:
        return MaterialPageRoute(builder: (context) => ElanPage());
      case DetailElanPage.routeName:
        return MaterialPageRoute(builder: (context) => DetailElanPage());

      //****** new */
      case ChatListPage.routeName:
        return MaterialPageRoute(builder: (context) => ChatListPage());
      default:
        return MaterialPageRoute(builder: (context) => ScanPage());
    }
  }
}
