import 'package:flutter/material.dart';
import 'package:oppuss/views/home/home_screen.dart';
import 'package:oppuss/widget/customized_appbar.dart';

import '../../utils/theme.dart';

class AcceuilePage extends StatefulWidget {
  const AcceuilePage({super.key});

  @override
  State<AcceuilePage> createState() => _AcceuilePageState();
}

class _AcceuilePageState extends State<AcceuilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar("Acceuil"),
      body: const Center( child: Text("Acceuil Page"),),
    );
  }
}