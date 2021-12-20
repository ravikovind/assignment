import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Image.asset(
        "assets/images/hamburger.png",
      ),
      title: Image.asset(
        "assets/images/logo.png",
        width: 80.0,
        height: 80.0,
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            "assets/images/profile.png",
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;
}
