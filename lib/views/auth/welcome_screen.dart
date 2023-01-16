import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/login_screen.dart';
import 'package:oppuss/views/auth/sign_up_ouvrier.dart';
import 'package:oppuss/views/home/home_screen.dart';
import 'package:oppuss/widget/customized_button.dart';

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
    
      appBar: AppBar(
        backgroundColor: kglobalColor,
        elevation: 0,
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: kPrimaryColor,), onPressed: () { 
               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const LoginScreen()));
         },),
      ),
      
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
           
             DelayedAnimation(delay: transitionAnimate,
              child:  Column(
                children: const [

                 
                 Text("Bienvenue sur OPPUSS.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    fontSize: 30
                  ),
                  textAlign: TextAlign.center,
                  ),
                  Text("Trouver l'ouvrier idéal pour tous travaux du BTP",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                  textAlign: TextAlign.center,
                  )
                ],
              ),),
               DelayedAnimation(
                delay: transitionAnimate,
                child: SizedBox(
                  height: 170,
                  child: SvgPicture.asset("assets/welcom.svg"),
                ),
              ),
              Column(
                children: <Widget>[
                  DelayedAnimation(delay: transitionAnimate, 
              child: CustomizedButton(
                  buttonText: "Commencer",
                  buttonColor: kPrimaryColor,
                  textColor: Colors.white,
                  onPressed: () async {

                    // c'est dans cette methode qu'il faut synchroniser des les informations saisies par
                    // par l'utilisateur pour les envoyer dans l'API

                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const HomeScreen()));
                  }),),
              
                  DelayedAnimation(delay: transitionAnimate, 
              child: CustomizedButton(
                  buttonText: "Devenir Ouvrier",
                  buttonColor: Colors.white,
                  textColor: kPrimaryColor,
                  
                  onPressed: () async {

                    // c'est dans cette methode qu'il faut synchroniser des les informations saisies par
                    // par l'utilisateur pour les envoyer dans l'API

                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreenOuvrier()));
                  }),),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}