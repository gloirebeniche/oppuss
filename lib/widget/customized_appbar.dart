import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';

class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  final Color backgroundColorAppBar;

  const CustomizedAppBar(
    {super.key,  required this.titleAppBar, required this.backgroundColorAppBar});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColorAppBar,
      title: Text(titleAppBar) ,
      leading: IconButton(icon: const Icon(Icons.arrow_back, color: kPrimaryColor,), onPressed: () {  },),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
