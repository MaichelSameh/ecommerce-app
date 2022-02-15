import 'package:flutter/material.dart';

import '../config/palette.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final bool showProfileImage;
  const CustomAppBar({
    Key? key,
    this.title,
    this.showProfileImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 339,
        margin: const EdgeInsets.only(top: 55),
        decoration: BoxDecoration(
          color: MyPalette.primary_color,
          boxShadow: MyPalette.primary_shadow,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            if (showProfileImage)
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: MyPalette.secondary_color,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60"),
                ),
              ),
            Text(
              title ?? "Maichel",
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
