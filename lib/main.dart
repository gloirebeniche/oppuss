import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/modules/chat_page.dart';
import 'package:oppuss/views/auth/sign_up_ouvrier.dart';
import 'package:oppuss/views/home/home_screen.dart';
import 'package:oppuss/views/particulars/coments.dart';
import 'package:oppuss/views/particulars/help.dart';
import 'package:oppuss/views/particulars/notification_view.dart';
import 'package:oppuss/views/particulars/offer_detail.dart';
import 'package:oppuss/views/particulars/profile_edit_view.dart';
import 'package:flutter/services.dart';
import 'package:oppuss/views/particulars/safe.dart';
import 'package:oppuss/views/particulars/settings.dart';
import 'package:oppuss/views/particulars/about.dart';
import 'package:oppuss/views/particulars/worker_profile.dart';
import 'package:oppuss/views/splash_screen.dart';
import 'package:oppuss/views/welcome_screen.dart';

void main() {
  
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => const SplashScreen(),
          routes: [
            GoRoute(
              path: "worker",
              builder: (context, state) => const SignUpScreenOuvrier(),
            ),
          ]),
      GoRoute(
        path: "/home",
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute( path: "profile", builder: (context, state) => const EditProfilePage(),),
          GoRoute( path: "notification", builder: (context, state) => const NotificationView(), ),
          GoRoute( path: "message", builder: (context, state) => ChatPage()),
          GoRoute( path: "offer_detail", builder: (context, state) => const OfferDetailView(),
            routes: [ 
              GoRoute(path: "coments", builder: (context, state) => const ComentView(),)
            ]
          ),
          GoRoute( path: "settings", builder: (context, state) => const SettingsView()),
          GoRoute( path: "help", builder: (context, state) => const HelpView()),
          GoRoute( path: "safe", builder: (context, state) => const SafeView()),
          GoRoute( path: "worker", builder: (context, state) => const SignUpScreenOuvrier()),
          GoRoute( path: "about", builder: (context, state) => const AboutView()),
          GoRoute( path: "worker_profile", builder: (context, state) => const WorkerProfile())
        ]
      ),
      GoRoute(path: "/welcome", builder: (context, state) => const WelcomeAuth()),
    ],
  );
}
