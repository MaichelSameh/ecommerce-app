import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/dir_config.dart';
import '../config/palette.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int nextPage) onPageChange;
  final int currentPage;
  const BottomNavBar({
    Key? key,
    required this.onPageChange,
    required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: MyPalette.secondary_color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildBottomNavItem(0, "home"),
          buildBottomNavItem(1, "shopping"),
          buildBottomNavItem(2, "cart"),
          buildBottomNavItem(3, "profile"),
        ],
      ),
    );
  }

  InkWell buildBottomNavItem(int index, String iconName) {
    return InkWell(
      onTap: currentPage == index ? null : () => onPageChange(index),
      splashColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SvgPicture.asset(
          DirConfig.icons_dir +
              iconName +
              (currentPage == index ? "_icon" : "_bordered_icon") +
              DirConfig.icons_extension,
        ),
      ),
    );
  }
}
