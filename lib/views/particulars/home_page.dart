import 'package:flutter/material.dart';
import 'package:oppuss/views/home/home_screen.dart';
import 'package:oppuss/widget/customized_appbar.dart';

import '../../utils/theme.dart';

class HomePageParticular extends StatefulWidget {
  const HomePageParticular({super.key});

  @override
  State<HomePageParticular> createState() => _HomePageParticularState();
}

class _HomePageParticularState extends State<HomePageParticular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar("Acceuil"),
      body: const Center( child: Text("Acceuil Page"),),
    );
  }
}