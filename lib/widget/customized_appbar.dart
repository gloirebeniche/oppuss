import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';

AppBar CustomAppBar(String title) {
  return AppBar(
    elevation: 1,
    backgroundColor: white,
    title: appbarTextStyle(title),
    automaticallyImplyLeading: false,
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 15),
        child: icon(EvaIcons.messageCircleOutline),
      )
    ],
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
     leading: IconButton(icon:icon(EvaIcons.arrowBackOutline) , onPressed: () { 
         Navigator.pop(context);
      },),
    );
  }
}
