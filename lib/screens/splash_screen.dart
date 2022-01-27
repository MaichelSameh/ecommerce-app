//now we need to create a timer to move us to a splash screen
import 'dart:async';

import 'package:flutter/material.dart';

import '../config/palette.dart';
import 'home/navigator_screen.dart';

class SplashScreen extends StatefulWidget {
  // ignore: constant_identifier_names
  static const String route_name = "splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(
          //here you can choose the duration you want,
          //but for me I will choose it to be 2 seconds
          seconds: 2,
        ), () {
      //this function will be executed after the duration finish
      Navigator.of(context).pushReplacementNamed(NavigatorScreen.route_name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //here we gonna show a simple splash screen.
      body: Stack(
        children: [
          Image.asset(
            "assets/images/splash_screen_image.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          // now we will add two layers to make the image more darker
          Container(
            width: double.infinity,
            height: double.infinity,
            //let's create first our theme file
            color: MyPalette.primary_color.withOpacity(0.7),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            //let's create first our theme file
            color: MyPalette.secondary_color.withOpacity(0.7),
          ),
          Center(
            child: Text(
              "SOUQLY",
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontFamily: "Lobster",
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
