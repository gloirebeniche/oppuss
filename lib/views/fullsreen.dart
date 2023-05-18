import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

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