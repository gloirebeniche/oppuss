import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/utils/theme.dart';

AppBar CustomAppBar(String title, BuildContext context) {
  return AppBar(
    elevation: 1.5,
    backgroundColor: white,
    title: customeTextStyle(title, black, size: appbarTextSize),
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: IconButton(
            onPressed: () {
              context.go("/home/message");
            },
            icon: icon(EvaIcons.messageCircleOutline)),
      )
    ],
  );
}

AppBar CustomAppBar2(String title, BuildContext context) {
  return AppBar(
    elevation: 0,
    title: customeTextStyle(title, black, size: appbarTextSize),
    backgroundColor: white,
    leading: IconButton(
      icon: icon(EvaIcons.arrowBackOutline),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
}

class CustomizeAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String title;
  final Color colorAppBar;

  const CustomizeAppBar({
    super.key,
    required this.title,
    required this.colorAppBar,
  }) : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
      ),
      backgroundColor: colorAppBar,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: icon(EvaIcons.arrowBackOutline),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
