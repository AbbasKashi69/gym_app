import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gym_app/Router/rout_generate.dart';
import 'package:gym_app/screen/CreateMovement/create_movement_page.dart';
import 'package:gym_app/screen/CreateProgramBody/create_program_body_page.dart';
import 'package:gym_app/screen/Cv/cv_page.dart';
import 'package:gym_app/screen/Home/home_page.dart';
import 'package:gym_app/screen/ProfileApprentice/profile_apprentice_page.dart';
import 'package:gym_app/screen/ProgramList/program_list_page.dart';

import 'extensions/ext.dart';

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
    return MaterialApp(
      title: 'gym',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('fa', '')],
      initialRoute: HomePage.routeName,
      onGenerateRoute: MyRouter.onGenerateRoute,
      theme: ThemeData(fontFamily: 'IRANSans'),
    );
  }
}
