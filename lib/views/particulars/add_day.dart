// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/ref_btp.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:provider/provider.dart';


class AddDay extends StatefulWidget {
  //final dynamic idDomaine;
  AddDay({super.key}); //required this.idDomaine};

  @override
  State<AddDay> createState() => _AddDayState();
}

class _AddDayState extends State<AddDay> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade600,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade600,
      ),
      body: Column(
        children: [
          customeTextStyle("Quel jour", white, size: 25, fontWeight: FontWeight.bold),
          customeTextStyle("vous conviens le plus ?", white, size: 25, fontWeight: FontWeight.bold),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: ListView(
                children: [
                
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}