import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/forgot_password.dart';
import 'package:oppuss/views/welcome_screen.dart';
import 'package:oppuss/views/home/home_screen.dart';
import 'package:oppuss/widget/button_widget_app.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    var _obscureText = true;
    
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: transitionAnimate,
                child: SizedBox(
                  height: 190,
                  child: SvgPicture.asset("assets/login.svg"),
                ),
              ),
              spacingHeight1,
                 DelayedAnimation(
                    delay: transitionAnimate,
                    child: Text(
                      "OPPUSS.",
                      style: GoogleFonts.poppins(
                        color: primaryColor,
                        fontSize: appbarTextSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  spacingHeight1,
          const DelayedAnimation(
            delay: 1500,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Votre Email',
                labelStyle: TextStyle(
                  color: grey,
                ),
              ),
            ),
          ),
            DelayedAnimation(
            delay: transitionAnimate,
            child: TextField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelStyle: const TextStyle(
                  color: grey,
                ),
                labelText: 'Mot de passe',
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.visibility,
                    color: black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                ),
              ),
                 ),
          ),
          const SizedBox(height: 10,),
          DelayedAnimation(delay: transitionAnimate, 
          child:  Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text("Mot de passe oublié?",
                        style: TextStyle(
                          color: Color(0xff6A707C),
                          fontSize: textSize,
                        )),
                  ),
                ),
              ),),
              DelayedAnimation(delay: transitionAnimate, 
              child: CustomizedButton(
                  buttonText: "Se connecter",
                  buttonColor: primaryColor,
                  textColor: Colors.white,
                  onPressed: () async {

                    // c'est dans cette methode qu'il faut synchroniser des les informations saisies par
                    // par l'utilisateur pour les envoyer dans l'API

                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  HomeScreen()));
                  }),),
              DelayedAnimation(delay: transitionAnimate, 
                  child:  Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Ou connectez-vous avec :", style: TextStyle(
                      fontSize: textSize
                    ),),
                  ],
                ),
              ),),
            DelayedAnimation(delay: transitionAnimate, 
            child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // google button
                Container(
                  decoration: BoxDecoration(                    
                    borderRadius: BorderRadius.circular(16),
                    color: bgColor,
                      ),
                         child: InkWell( 
                              onTap: (() {}
                                      ), 
                              child: Image.asset("assets/google.png",
                                  height: 40,),
                           
                            )),
                                  // google button
                Container(
                  decoration: BoxDecoration(                    
                    borderRadius: BorderRadius.circular(16),
                    color: bgColor,
                      ),
                         child: InkWell( 
                              onTap: (() {}
                                      ), 
                              child: Image.asset("assets/facebook.png",
                                  height: 40,),
                           
                            )),
               

                   
                  ],
                ),
              ),),
                 DelayedAnimation(delay: transitionAnimate, 
                        child:Padding(
                        padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const WelcomeAuth()));
                          },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text("Vous n'avez pas de compte ?",
                          style: TextStyle(
                            color: Color(0xff1E232C),
                            fontSize: textSize,
                          )),
                      Text(" S'inscrire ici",
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: textSize,
                          )),
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}