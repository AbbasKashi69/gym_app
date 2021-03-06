import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:gym_app/Router/rout_generate.dart';
import 'package:gym_app/ViewModels/CurrentUserVm.dart';
import 'package:gym_app/blocs/Person/bloc/edit_person_bloc.dart';

import 'package:gym_app/blocs/Subscription/bloc/get_subscription_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_my_deposit_bloc.dart';
import 'package:gym_app/blocs/WalletLog/bloc/get_my_deposit_bloc.dart';
import 'package:gym_app/components/customBottomBar.dart';

import 'package:gym_app/screen/Home/home_page.dart';
import 'package:gym_app/screen/Login/login_page.dart';

import 'package:gym_app/screen/Scan/scan_page.dart';
import 'package:gym_app/screen/Wallet/turnover_page.dart';
import 'package:gym_app/screen/Wallet/wallet_page.dart';
import 'package:get/get.dart';
import 'package:gym_app/screen/profile_page/profile_page.dart';
import 'package:gym_app/screen/setting_addjob_final_page.dart';
import 'package:gym_app/screen/subscription_page/subscription_page.dart';

import 'Services/LocalSavingService.dart';
import 'ViewModels/BodyBuildingMovement/BodyBuildingMovementVm.dart';
import 'ViewModels/WalletLog/transferBankVm.dart';
import 'ViewModels/WalletLog/transferToOtherWalletVm.dart';
import 'blocs/BottomNav/bloc/bottom_nav_bloc.dart';
import 'blocs/Person/bloc/find_person_by_id_bloc.dart';
import 'blocs/Setting/setting_bloc.dart';
import 'blocs/Subscription/bloc/get_subscription_invoice_bloc.dart';
import 'blocs/WalletLog/bloc/get_all_deposit_bloc.dart';
import 'blocs/WalletLog/bloc/get_all_withraw_bloc.dart';
import 'blocs/WalletLog/bloc/get_my_deposit_bloc.dart';
import 'blocs/WalletLog/bloc/get_my_withdrawal_bloc.dart';
import 'blocs/WalletLog/bloc/get_my_wallet_ballance_bloc.dart';
import 'blocs/WalletLog/bloc/get_transfer_other_wallet_bloc.dart';
import 'blocs/WalletLog/bloc/get_transfer_to_card_bank_bloc.dart';
import 'blocs/WalletLog/bloc/increase_bloc.dart';
import 'blocs/WalletLog/bloc/transfer_other_wallet_bloc.dart';
import 'blocs/WalletLog/bloc/transfer_to_cart_bank_bloc.dart';
import ' extensions/ext.dart';

void main() async {
  HttpOverrides.global = new MyHttpOverrides();

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
              SubscriptionBloc()..add(SubscriptionLoadingEvent()),
          child: HomePage(),
        );
      case 1:
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetSubscriptionInvoiceBloc()
                ..add(GetSubscriptionInvoiceLoadingEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  SubscriptionBloc()..add(SubscriptionLoadingEvent()),
            )
          ],
          child: SubscriptionPage(),
        );
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
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => GetMyWalletBallanceBloc()
                ..add(GetMyWalletBallanceLoadingEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  GetWithdrawalBloc()..add(GetMyWithdrawalLoadingEvent()),
            ),
            BlocProvider(
              create: (context) =>
                  GetMyDepositBloc()..add(GetMyDepositLoadingEvent()),
            ),
          ],
          child: WalletPage(),
        );

      default:
        return Container(child: Center(child: Text('?????????? ???????? ????????')));
    }
  }

  Future<bool> _willPopAction() async {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: '???????? ???????? ???????????? ???? ?????????? ??????????');
      return Future.value(false);
    } else
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');

    return Future.value(true);
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
