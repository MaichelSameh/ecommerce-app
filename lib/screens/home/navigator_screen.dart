import 'package:flutter/material.dart';

class NavigatorScreen extends StatefulWidget {
  // ignore: constant_identifier_names
  static const String route_name = "navigator_screen";
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HomeScreen"),
      ),
    );
  }
}
