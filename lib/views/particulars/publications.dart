import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';


class Publications extends StatefulWidget {
  const Publications({super.key});

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
    backgroundColor: KbackgroundColor,
      body: Center(
        child: Text("Publications"),
      ),
    );
  }
}