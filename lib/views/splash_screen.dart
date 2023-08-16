import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oppuss/views/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/theme.dart';
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
      Timer(const Duration(seconds: 0), () {
        Get.off(() => const WelcomeAuth(), transition: Transition.fadeIn, duration: const Duration(milliseconds: durationAnime));
      });
    } else {
      Timer(const Duration(seconds: 0), () {Get.off(() => const HomeScreen(), transition: Transition.fadeIn, duration: const Duration(milliseconds: durationAnime));
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
      body: Center(
        child: Image(image: AssetImage("assets/playstore.png")),
      )
    );
  }
}
