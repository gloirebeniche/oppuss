import 'package:flutter/material.dart';
import 'package:oppuss/widget/customized_appbar.dart';

class ComentView extends StatefulWidget {
  const ComentView({super.key});

  @override
  State<ComentView> createState() => _ComentViewState();
}

class _ComentViewState extends State<ComentView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("Questions et réponses", context),
    );
  }
}