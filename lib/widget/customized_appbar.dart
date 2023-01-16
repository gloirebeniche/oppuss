import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';

class CustomizedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleAppBar;
  final bool iconVisibility = true;

  const CustomizedAppBar(
      {super.key,
      required this.titleAppBar,
     
     });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: iconVisibility,
      elevation: 0,
      title: Text(
        titleAppBar,
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: kPrimaryColor,
        ),
        onPressed: () {},
      ),
    );
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
