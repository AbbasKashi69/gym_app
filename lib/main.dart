import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gym_app/Router/rout_generate.dart';
import 'package:gym_app/screen/Home/home_page.dart';

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
      theme: ThemeData(
        fontFamily: 'IRANSans'
      ),
    );
  }
}
