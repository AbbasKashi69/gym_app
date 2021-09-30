import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeDayTermVm.dart';
import 'package:gym_app/ViewModels/AnonymousPlanType/AnonymousPlanTypeFormVm.dart';
<<<<<<< HEAD
import 'package:gym_app/ViewModels/WalletLog/IncreaseCreditVm.dart';
=======
import 'package:gym_app/ViewModels/BodyBuildingPlanType/BodyBuildingPlanTypeFormVm.dart';
import 'package:gym_app/ViewModels/CoachStudent/CoachStudentVm.dart';
import 'package:gym_app/ViewModels/DietPlanType/DietPlanTypeFormVm.dart';
import 'package:gym_app/blocs/Account/bloc/get_current_user_role_bloc.dart';
>>>>>>> 3c131c738e42093acbfd14bd403af76d18124e87
import 'package:gym_app/blocs/Account/bloc/login_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/register_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/send_code_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/submit_register_bloc.dart';
import 'package:gym_app/blocs/Account/bloc/verify_code_bloc.dart';
import 'package:gym_app/blocs/AnonymousPlanType/bloc/create_using_form_bloc.dart';
import 'package:gym_app/blocs/BodyBuildingMovement/bloc/get_user_body_building_movement_list_bloc.dart';
import 'package:gym_app/blocs/BodyBuildingPlanType/bloc/create_using_form_body_building_bloc.dart';
import 'package:gym_app/blocs/BottomNav/bloc/bottom_nav_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/change_status_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_coach_students_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_student_coaches_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/get_students_as_person_list_bloc.dart';
import 'package:gym_app/blocs/CoachStudent/bloc/request_to_coach_bloc.dart';
import 'package:gym_app/blocs/DietPlanType/bloc/create_using_form_diet_bloc.dart';
import 'package:gym_app/blocs/PlanType/bloc/get_plans_by_sort_bloc.dart';
import 'package:gym_app/blocs/Resume/bloc/get_resume_bloc.dart';
import 'package:gym_app/blocs/Subscription/bloc/get_subscription_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/increase_bloc.dart';
import 'package:gym_app/main.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateMovementDiet/create_movement_diet_page.dart';
import 'package:gym_app/screen/CreateMovementOtherSports/create_movement_other_sports_page.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/CreateProgramDiet/create_program_diet_page.dart';
import 'package:gym_app/screen/CreateProgramDietSetting/create_program_diet_setting_page.dart';
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
import 'package:gym_app/screen/Wallet/Increase_page.dart';
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
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (context) => GetCurrentUserRoleBloc()
                          ..add(GetCurrentUserRoleLoadingEvent())),
                    BlocProvider(
                      create: (context) =>
                          BottomNavBloc()..add(BottomNavLoadingEvent(index: 0)),
                    )
                  ],
                  child: MyHomePage(),
                ));
      case ScanPage.routeName:
        return MaterialPageRoute(builder: (context) => ScanPage());
      case ListApprenticePage.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => GetCoachStudentsBloc()
                        ..add(GetCoachStudentsLoadingEvent()),
                    ),
                    BlocProvider(
                      create: (context) => GetStudentsAsPersonListBloc()
                        ..add(GetStudentsAsPersonListLoadingEvent()),
                    ),
                  ],
                  child: ListApprenticePage(),
                ));
      case RequestsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => ChangeStatusBloc(),
                    ),
                    BlocProvider(
                      create: (context) => GetCoachStudentsBloc()
                        ..add(GetCoachStudentsLoadingEvent()),
                    ),
                  ],
                  child: RequestsPage(),
                ));
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) => HomePage());
      case SubscriptionPage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) =>
                SubscriptionBloc()..add(SubscriptionLoadingEvent()),
                child: SubscriptionPage())
        );
      case ProfilePage.routeName:
        return MaterialPageRoute(builder: (context) => ProfilePage());
      case IncreaseWalletPage.routeName:
        var increaseCreditVm = routeSettings.arguments;

        return MaterialPageRoute(builder: (context) => BlocProvider(
            create: (context) =>
            IncreaseBloc()..add(IncreaseLoadingEvent(increaseCreditVm: increaseCreditVm as IncreaseCreditVm)),
            child: IncreaseWalletPage())

        );
      case ProfileApprenticePage.routeName:
        {
          var coachStudentVm = routeSettings.arguments;
          return MaterialPageRoute(
              builder: (context) => ProfileApprenticePage(
                  coachStudentVm: coachStudentVm as CoachStudentVm));
        }
      case WalletPage.routeName:
        return MaterialPageRoute(builder: (context) => WalletPage());
      case CvPage.routeName:
<<<<<<< HEAD
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                create: (context) =>
                    GetResumeBloc()..add(GetResumeLoadingEvent()),
                child: CvPage())
        );
=======
        {
          var data = routeSettings.arguments;
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (context) => GetResumeBloc()
                    ..add(GetResumeLoadingEvent(coachId: data as int)),
                  child: CvPage()));
        }
>>>>>>> 3c131c738e42093acbfd14bd403af76d18124e87
      case PersonalInfoPage.routeName:
        return MaterialPageRoute(builder: (context) => PersonalInfoPage());
      case SettingPage.routeName:
        return MaterialPageRoute(builder: (context) => SettingPage());
      case CreateProgramBodyPage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => GetStudentsAsPersonListBloc(),
                  child: CreateProgramBodyPage(),
                ));
      case CreateMovementPage.routeName:
        {
          var myBodyVm = routeSettings.arguments as MyBodyVm;
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => GetUserBodyBuildingMovementListBloc(),
                    child: CreateMovementPage(
                      bodyBuildingPlanTypeFormVm:
                          myBodyVm.bodyBuildingPlanTypeFormVm,
                      bodyBuildingPlanDayTermVm:
                          myBodyVm.bodyBuildingPlanDayTermVm,
                    ),
                  ));
        }
      case CreateMovementOtherSportsPage.routeName:
        {
          var myVm = routeSettings.arguments as MyVm;
          return MaterialPageRoute(
              builder: (context) => CreateMovementOtherSportsPage(
                    anonymousPlanTypeDayTermVm: myVm.anonymousPlanTypeDayTermVm,
                    anonymousPlantypeFormVm: myVm.anonymousPlantypeFormVm,
                  ));
        }
      case CreateMovementDietPage.routeName:
        {
          var myDietVm = routeSettings.arguments as MyDietVm;
          return MaterialPageRoute(
              builder: (context) => CreateMovementDietPage(
                    dietPlanTypeDayTermVm: myDietVm.dietPlanTypeDayMealVm,
                    dietPlanTypeFormVm: myDietVm.dietPlanTypeFormVm,
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
        {
          var bodyBuildingPlanTypeFormVm = routeSettings.arguments;
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                  create: (context) => CreateUsingFormBodyBuildingBloc(),
                  child: CreateProgramBodySettingPage(
                    bodyBuildingPlanTypeFormVm: bodyBuildingPlanTypeFormVm
                        as BodyBuildingPlanTypeFormVm,
                  )));
        }
      case CreateProgramOtherSportsSettingPage.routeName:
        {
          var anonymousPlantypeFormVm = routeSettings.arguments;
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => CreateUsingFormOthersSportsBloc(),
                    child: CreateProgramOtherSportsSettingPage(
                        anonymousPlantypeFormVm:
                            anonymousPlantypeFormVm as AnonymousPlantypeFormVm),
                  ));
        }
      case CreateProgramDietSettingPage.routeName:
        {
          var dietPlanTypeFormVm = routeSettings.arguments;
          return MaterialPageRoute(
              builder: (context) => BlocProvider(
                    create: (context) => CreateUsingFormDietBloc(),
                    child: CreateProgramDietSettingPage(
                        dietPlanTypeFormVm:
                            dietPlanTypeFormVm as DietPlanTypeFormVm),
                  ));
        }
      case ObserveProgramBody.routeName:
        return MaterialPageRoute(builder: (context) => ObserveProgramBody());
      case ObserveOtherSportsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => ObserveOtherSportsPage());
      case ListCoachPage.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider(
                    create: (context) => GetStudentCoachesBloc()
                      ..add(GetStudentCoachesLoadingEvent()),
                  ),
                  BlocProvider(
                    create: (context) => RequestToCoachBloc(),
                  ),
                ], child: ListCoachPage()));
      case ProfileCoachPage.routeName:
        {
          var coachStudentVm = routeSettings.arguments;
          return MaterialPageRoute(
              builder: (context) => ProfileCoachPage(
                  coachStudentVm: coachStudentVm as CoachStudentVm));
        }
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
                      create: (context) => CreateUsingFormOthersSportsBloc(),
                    ),
                    BlocProvider(
                      create: (context) => GetStudentsAsPersonListBloc(),
                    )
                  ],
                  child: CreateProgramOtherSportsPage(),
                ));
      case CreateProgramDietPage.routeName:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => CreateUsingFormOthersSportsBloc(),
                    ),
                    BlocProvider(
                      create: (context) => GetStudentsAsPersonListBloc(),
                    )
                  ],
                  child: CreateProgramDietPage(),
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
