import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:gym_app/Router/rout_generate.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/blocs/Person/bloc/edit_person_bloc.dart';
import 'package:gym_app/components/customBottomBar.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/Home/home_page.dart';
import 'package:gym_app/screen/Login/login_page.dart';
import 'package:gym_app/screen/ProgramList/program_list_page.dart';
import 'package:gym_app/screen/Register/register_page.dart';
import 'package:gym_app/screen/Scan/scan_page.dart';
import 'package:gym_app/screen/Wallet/wallet_page.dart';
import 'package:get/get.dart';
import 'package:gym_app/screen/chat/chat_list_page.dart';
import 'package:gym_app/screen/createProgramBodySetting/create_program_body_setting_page.dart';
import 'package:gym_app/screen/profile_page/profile_page.dart';
import 'package:gym_app/screen/subscription_page/subscription_page.dart';

import 'Services/LocalSavingService.dart';
import 'blocs/BottomNav/bloc/bottom_nav_bloc.dart';
import 'blocs/Person/bloc/find_person_by_id_bloc.dart';
import 'blocs/WalletLog/bloc/get_my_wallet_ballance_bloc.dart';
import ' extensions/ext.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CurrentUserVm.localSavingService = await LocalSavingService.create();
  CurrentUserVm.localSavingService!.getUser();
  // CurrentUserVm.localSavingService!.logOff();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
  start();
}

void start() async {
  await App.init();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'gym',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale("fa", "IR"),
      initialRoute: CurrentUserVm.token == null || CurrentUserVm.token!.isEmpty
          ? LoginPage.routeName
          : MyHomePage.routeName,
      onGenerateRoute: MyRouter.onGenerateRoute,
      theme: ThemeData(fontFamily: 'IRANSans'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/';
  static int lastDisplayOtherSports = 0;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _willPopAction();
      },
      child: Scaffold(
        body: BlocBuilder<BottomNavBloc, BottomNavState>(
          builder: (context, state) {
            if (state is BottomNavLoadedState) return loadScreen(state.index);
            return Container();
          },
        ),
        bottomNavigationBar: CustomAppBarWidget(),
      ),
    );
  }

  Widget loadScreen(int index) {
    switch (index) {
      case 0:
        return BlocProvider(
          create: (context) =>
              GetMyWalletBallanceBloc()..add(GetMyWalletBallanceLoadingEvent()),
          child: HomePage(),
        );
      case 1:
        return SubscriptionPage();
      case 2:
        return ScanPage();
      case 3:
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  FindPersonByIdBloc()..add(FindPersonByIdLoadingEvent()),
            ),
            BlocProvider(
              create: (context) => EditPersonBloc(),
            ),
          ],
          child: ProfilePage(),
        );

      case 4:
        return WalletPage();

      default:
        return Container(child: Center(child: Text('مشکلی وجود دارد')));
    }
  }

  Future<bool> _willPopAction() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      // Fluttertoast.showToast(msg: 'برای خروج بازگشت را دوبار بزنید');
      return Future.value(false);
    } else
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');

    return Future.value(true);
  }
}
