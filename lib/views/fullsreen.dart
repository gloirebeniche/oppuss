
import 'package:flutter/material.dart';

import '../utils/theme.dart';

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