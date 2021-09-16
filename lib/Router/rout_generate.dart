import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeDayTermVm.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
import 'package:gym_app/blocs/Account/bloc/login_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/register_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/send_code_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/submit_register_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/verify_code_bloc.dart';
import 'package:gym_app/blocs/AnonymousPlanType/bloc/create_using_form_bloc.dart';
import 'package:gym_app/blocs/BottomNav/bloc/bottom_nav_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_students_as_person_list_bloc.dart';
import 'package:gym_app/blocs/PlanType/bloc/get_plans_by_sort_bloc.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateMovementOtherSports/create_movement_other_sports_page.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/CreateProgramOtherSports/create_program_other_sports_page.dart';
import 'package:gym_app/screen/CreateProgramOtherSportsSetting/create_program_other_sports_setting_pages.dart';
import 'package:gym_app/screen/DetailElan/detail_elan_page.dart';
import 'package:gym_app/screen/Elanha/elan_page.dart';
import 'package:gym_app/screen/Home/home_page.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/ListApprentice/list_Apprentice_page.dart';
import 'package:gym_app/screen/ListApprentice/requests_page.dart';
import 'package:gym_app/screen/ListCoach/list_coach_page.dart';
import 'package:gym_app/screen/Login/login_page.dart';
import 'package:gym_app/screen/PersonalInfo/personal_info_page.dart';
import 'package:gym_app/screen/PersonalInfoCoach/personal_info_coach_page.dart';
import 'package:gym_app/screen/ProfileApprentice/profile_apprentice_page.dart';
import 'package:gym_app/screen/ProfileCoach/profile_coach_page.dart';
import 'package:gym_app/screen/ProgramList/program_list_page.dart';
import 'package:gym_app/screen/Register/register_page.dart';
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
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => GetStudentsAsPersonListBloc()
                    ..add(GetStudentsAsPersonListLoadingEvent()),
                  child: ListApprenticePage(),
                ));
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
      case CreateMovementOtherSportsPage.routeName:
        {
          var myVm = routeSettings.arguments as MyVm;
          return MaterialPageRoute(
              builder: (context) => CreateMovementOtherSportsPage(
                    anonymousPlanTypeDayTermVm: myVm.anonymousPlanTypeDayTermVm,
                    anonymousPlantypeFormVm: myVm.anonymousPlantypeFormVm,
                  ));
        }
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
      case CreateProgramOtherSportsSettingPage.routeName:
        {
          var anonymousPlantypeFormVm = routeSettings.arguments;
          return MaterialPageRoute(
              builder: (context) => CreateProgramOtherSportsSettingPage(
                  anonymousPlantypeFormVm:
                      anonymousPlantypeFormVm as AnonymousPlantypeFormVm));
        }
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
      case LoginPage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => LoginBloc(),
                  child: LoginPage(),
                ));
      case CreateProgramOtherSportsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CreateUsingFormBloc(),
                    ),
                    BlocProvider(
                      create: (context) => GetStudentsAsPersonListBloc(),
                    )
                  ],
                  child: CreateProgramOtherSportsPage(),
                ));
      case RegisterPage.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => RegisterBloc(),
                    ),
                    BlocProvider(
                      create: (context) => SendCodeBloc(),
                    ),
                    BlocProvider(
                      create: (context) => VerifyCodeBloc(),
                    ),
                    BlocProvider(
                      create: (context) => SubmitRegisterBloc(),
                    ),
                  ],
                  child: RegisterPage(),
                ));

      default:
        return MaterialPageRoute(builder: (context) => ScanPage());
    }
  }
}
