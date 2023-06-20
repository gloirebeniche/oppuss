// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/modules/chat_page.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/login_screen.dart';
import 'package:oppuss/views/auth/sign_up_ouvrier.dart';
import 'package:oppuss/views/fullsreen.dart';
import 'package:oppuss/views/particulars/home_screen.dart';
import 'package:oppuss/views/particulars/demande/coments.dart';
import 'package:flutter/services.dart';
import 'package:oppuss/views/particulars/publier/publications.dart';
import 'package:oppuss/views/particulars/search/worker_profile.dart';
import 'package:oppuss/views/splash_screen.dart';
import 'package:oppuss/views/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'views/auth/sign_up_particuler.dart';
import 'views/particulars/account/about.dart';
import 'views/particulars/account/help.dart';
import 'views/particulars/account/notification_view.dart';
import 'views/particulars/account/profile_edit_view.dart';
import 'views/particulars/account/safe.dart';
import 'views/particulars/account/settings.dart';
import 'views/particulars/demande/offer_detail.dart';
import 'views/particulars/demande/offer_more_detail.dart';
import 'views/particulars/demande/offer_update.dart';
import 'views/particulars/publier/add_day.dart';
import 'views/particulars/publier/add_travaux.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child : MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      )
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
          GoRoute( 
            path: "add_offer", builder: (context, state) => const AddOffer(),
            routes: [
              GoRoute( 
                path: "add_travaux/:idDomaine", builder: (context, state) => AddTravaux(
                  idDomaine:state.params['idDomaine']
                ), 
                routes: [
                  GoRoute( path: "addDay", builder: (context, state) => AddDay(),)
                ]
              ),
            ]
          ),
          GoRoute( path: "notification", builder: (context, state) => const NotificationView(), ),
          GoRoute( path: "message", builder: (context, state) => const ChatPage()),
          GoRoute( path: "offer_detail/:id_offre", builder: (context, state) => OfferDetailView(
            id_offre:state.params['id_offre']
          ),
            routes: [ 
              GoRoute(path: "coments/:idOffre", builder: (context, state) => ComentView(
                idOffre:state.params['idOffre']
              ),),
              
              GoRoute(path: "view/:idOffre", builder: (context, state) => OfferMoreDetailPage(
                idOffre:state.params['idOffre']
              )),
              
              GoRoute( path: "worker_profile/:worker_id", builder: (context, state) => WorkerProfile(
                worker_id:state.params['worker_id']
              )),

              GoRoute(path: "update_offer", builder: (context, state) => const UpdateOfferPage() ),
            ]
          ),
          GoRoute( path: "settings", builder: (context, state) => const SettingsView()),
          GoRoute( path: "help", builder: (context, state) => const HelpView()),
          GoRoute( path: "safe", builder: (context, state) => const SafeView()),
          GoRoute( path: "worker", builder: (context, state) => const SignUpScreenOuvrier()),
          GoRoute( path: "about", builder: (context, state) => const AboutView()),
          GoRoute( path: "worker_profile/:worker_id", builder: (context, state) => WorkerProfile(
            worker_id:state.params['worker_id']
          )),

          //Route pour l'authentification
          GoRoute(path: "login", builder: (context, state) => const LoginScreen()),
          GoRoute(path: "user_register", builder: (context, state) => const SignUpScreenParticuler()),
        ]
      ),
      GoRoute(path: "/welcome", builder: (context, state) => const WelcomeAuth()),
      GoRoute(path: "/loading_screen", builder: (context, state) => const LoadingScreen())
    ],
  );
}
