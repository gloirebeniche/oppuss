import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  bool result = false;
  bool checkEvery5Seconds() {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      try {
        result = true;
        await http.get(Uri.parse("api_domaine_view"));
        context.go("/home");
      }catch(e){
        messageBox(context, "Connection au serveur impossible");
      }
    });
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkEvery5Seconds();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: white,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
        child: Center(
          child: Column(
              children: [
                const CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: customeTextStyle("Chargement...", size:appbarTextSize, black),
                ),
              ],
            ),
        ),
      ),
    );
  }
}