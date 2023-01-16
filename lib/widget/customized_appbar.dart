
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import "package:flutter/material.dart";
import 'package:oppuss/utils/theme.dart';

AppBar CustomizedAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: kglobalColor,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: kPrimaryColor,
        
      ),
      onPressed: () {
        
      },
    ),
  );
}
