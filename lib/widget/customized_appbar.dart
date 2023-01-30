import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';

AppBar CustomAppBar(String title){
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