import 'package:flutter/material.dart';

class AcceuilePage extends StatefulWidget {
  const AcceuilePage({super.key});

  @override
  State<AcceuilePage> createState() => _AcceuilePageState();
}

class _AcceuilePageState extends State<AcceuilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Acceuil Page"),
      ),
    );
  }
}