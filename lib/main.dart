import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gym_app/Router/rout_generate.dart';
import 'package:gym_app/components/customBottomBar.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/Home/home_page.dart';
import 'package:gym_app/screen/ProgramList/program_list_page.dart';
import 'package:gym_app/screen/Scan/scan_page.dart';
import 'package:gym_app/screen/Wallet/wallet_page.dart';
import 'package:get/get.dart';
import 'package:gym_app/screen/chat/chat_list_page.dart';
import 'package:gym_app/screen/createProgramBodySetting/create_program_body_setting_page.dart';
import 'package:gym_app/screen/profile_page/profile_page.dart';
import 'package:gym_app/screen/subscription_page/subscription_page.dart';

import 'blocs/BottomNav/bloc/bottom_nav_bloc.dart';
import 'blocs/WalletLog/bloc/get_my_wallet_ballance_bloc.dart';
import ' extensions/ext.dart';

void main() {
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
      initialRoute: MyHomePage.routeName,
      onGenerateRoute: MyRouter.onGenerateRoute,
      theme: ThemeData(fontFamily: 'IRANSans'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/';

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
        return BlocProvider(
          create: (context) =>
              GetMyWalletBallanceBloc()..add(GetMyWalletBallanceLoadingEvent()),
          child: SubscriptionPage(),
        );
      case 2:
        return ScanPage();
      case 3:
        return ProfilePage();
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
      Get.showSnackbar(GetBar(
        message: 'برای خروج بازگشت را دوبار بزنید',
      ));
      return Future.value(false);
    } else
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');

    return Future.value(true);
  }
}
