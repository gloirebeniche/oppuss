import 'package:flutter/material.dart';
import 'package:oppuss/widget/customized_appbar.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("Confiance et sécurite",context),
    );
  }
}