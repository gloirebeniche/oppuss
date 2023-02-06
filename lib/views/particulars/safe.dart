import 'package:flutter/material.dart';
import 'package:oppuss/widget/customized_appbar.dart';

class SafeView extends StatefulWidget {
  const SafeView({super.key});

  @override
  State<SafeView> createState() => _SafeViewState();
}

class _SafeViewState extends State<SafeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("Confiance et sécurite",context),
    );
  }
}