import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/home/home_screen.dart';
import 'package:oppuss/widget/button_widget_app.dart';

import 'login_screen.dart';

class SignUpScreenOuvrier extends StatefulWidget {
  const SignUpScreenOuvrier({super.key});

  @override
  State<SignUpScreenOuvrier> createState() => _SignUpScreenOuvrierState();
}

class _SignUpScreenOuvrierState extends State<SignUpScreenOuvrier> {
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
           appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            leading: IconButton(icon: Icon(Icons.arrow_back,color: primaryColor,), onPressed: () { 
                  Navigator.pop(context);
         },),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: transitionAnimate,
                child: SizedBox(
                  height: 120,
                  child: SvgPicture.asset("assets/ouvrier.svg"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DelayedAnimation(
                delay: 1700,
                child: Text(
                  "Nous Rejoindre",
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: appbarTextSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              spacingHeight2,
              const DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom d\'utilisateur',
                    labelStyle: TextStyle(
                      color: grey,
                    ),
                  ),
                ),
              ),
              const DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Votre Email',
                    labelStyle: TextStyle(
                      color: grey,
                    ),
                  ),
                ),
              ),
              const DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Profile',
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
                        color: Colors.black,
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
              DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(
                      color: grey,
                    ),
                    labelText: 'Confirmation mot de passe',
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
              spacingHeight1,
              DelayedAnimation(
                delay: transitionAnimate,
                child: CustomizedButton(
                    buttonText: "S'inscrire",
                    buttonColor: primaryColor,
                    textColor: white,
                    onPressed: () async {
                      // c'est dans cette methode qu'il faut synchroniser des les informations saisies par
                      // par l'utilisateur pour les envoyer dans l'API
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  const HomeScreen()));
                    }),
              ),
         
              DelayedAnimation(
                  delay: transitionAnimate,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       
                        children:  [
                          Text("Si vous avec déjà un compte?",
                              style: TextStyle(
                                color: Color(0xff1E232C),
                                fontSize: textSize,
                              )),
                          Text(" Connectez vous ici",
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
