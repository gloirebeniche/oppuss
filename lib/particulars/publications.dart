import 'package:flutter/material.dart';


class Publications extends StatefulWidget {
  const Publications({super.key});

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
      body: Center(
        child: Text("Publications"),
      ),
    );
  }
}