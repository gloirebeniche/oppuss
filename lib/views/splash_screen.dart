import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oppuss/views/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'particulars/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  Future<void> checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = (prefs.getBool('first_launch') ?? true);

    if (isFirstLaunch) {
      await prefs.setBool('first_launch', false);
      Timer(const Duration(seconds: 2), () {
        Get.to(() => const WelcomeAuth(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 300));
      });
    } else {
      Timer(const Duration(seconds: 2), () {
        Get.off(() => const HomeScreen(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 300));
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkFirstSeen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF1976D2),
                Color(0xFF82B1FF),
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/logo_blanc.PNG",
                  height: 300.0,
                  width: 300.0,
                ),
                const Text(
                  "Pour tous vos travaux de batiments\n et de renauvation",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            // const CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}
