import 'package:flutter/material.dart';
import 'package:oppuss/widget/customized_appbar.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("Centre d'aide", context),
    );
  }
}