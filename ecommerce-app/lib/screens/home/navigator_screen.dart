import 'package:flutter/material.dart';

import '../../widgets/bottom_nav_bar.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'shopping_screen.dart';

class NavigatorScreen extends StatefulWidget {
  // ignore: constant_identifier_names
  static const String route_name = "navigator_screen";
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  _NavigatorScreenState createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  List<Widget> pages = const [
    HomeScreen(),
    ShoppingScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  int currentPage = 0;
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: pages,
        onPageChanged: (newPage) {
          setState(() {
            currentPage = newPage;
          });
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentPage: currentPage,
        onPageChange: (nextPage) {
          controller.animateToPage(
            nextPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.bounceIn,
          );
        },
      ),
    );
  }
}
