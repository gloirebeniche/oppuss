import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: slash_for_doc_comments
/**
 *  author : gloire beniche 
 * date :  !17/12/2022
 * comment : cette classe prépare l'utilisateur às'inscrire en que q'ouvrier ou particuler
 */

class WelcomeAuth extends StatelessWidget {
  const WelcomeAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                DelayedAnimation(
                  delay: transitionAnimate,
                  child: Column(
                    children: [
                      bigTextStyle(
                          "Bienvenue sur OPPUSS", bigTextSize2, primaryColor),
                      spacingHeight1,
                      bigTextStyle(
                          "Trouver l'ouvrier idéal pour tous travaux du BTP",
                          textSizeH2,
                          black)
                    ],
                  ),
                ),
                DelayedAnimation(
                  delay: transitionAnimate,
                  child: SizedBox(
                    height: 170,
                    child: SvgPicture.asset("assets/welcom.svg"),
                  ),
                ),
                Column(
                  children: <Widget>[
                    DelayedAnimation(
                      delay: transitionAnimate,
                      child: CustomButton("Commencer", (() async {
                        try {
                          await http.get(Uri.parse(api_domaine_view));
                          fetchDomaines();
                          fetchMetier();
                          fetchTravaux();
                          context.go("/home");
                        }catch(e){
                          print("Aucune connexion avec le serveur");
                          context.go("/loading_screen");
                        }
                        
                      })),
                    ),
                    DelayedAnimation(
                      delay: transitionAnimate,
                      child: CustomOutlinedButton("Devenir ouvrier", (() {
                        //context.go("/worker");
                      })),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
