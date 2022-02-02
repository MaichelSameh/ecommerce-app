import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/route_manager.dart';

import 'config/palette.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "souqly",
      initialRoute: SplashScreen.route_name,
      routes: {
        SplashScreen.route_name: (_) =>
            const SplashScreen(key: Key(SplashScreen.route_name)),
        NavigatorScreen.route_name: (_) =>
            const NavigatorScreen(key: Key(NavigatorScreen.route_name)),
      },
      themeMode: ThemeMode.dark,
      theme: ThemeData(),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: MyPalette.primary_color,
        textTheme: const TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 12,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
