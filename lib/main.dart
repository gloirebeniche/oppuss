import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oppuss/views/welcome_screen.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   routerConfig: router,
    //   debugShowCheckedModeBanner: false,
    // );

    return const MaterialApp(
      home: WelcomeAuth(),
      debugShowCheckedModeBanner: false,
    );
  }
}
