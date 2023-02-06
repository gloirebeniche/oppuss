import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/customized_appbar.dart';


class Publications extends StatefulWidget {
  const Publications({super.key});

  @override
  State<Publications> createState() => _PublicationsState();
}

class _PublicationsState extends State<Publications> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: bgColor,
      appBar: CustomAppBar("Publication",context),
      body: const Center(
        child: Text("Publications"),
      ),
    );
  }
}