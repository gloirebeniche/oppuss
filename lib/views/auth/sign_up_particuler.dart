import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/welcome_screen.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';


class SignUpScreenParticuler extends StatefulWidget {
  const SignUpScreenParticuler({super.key});

  @override
  State<SignUpScreenParticuler> createState() => _SignUpScreenParticulerState();
}

class _SignUpScreenParticulerState extends State<SignUpScreenParticuler> {
 
  var _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("", context),
      backgroundColor: white, //const Color(0xFFEDECF2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            children: [
              DelayedAnimation(
                delay: transitionAnimate,
                child: SizedBox(
                  height: 120,
                  child: SvgPicture.asset("assets/3.svg"),
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
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Nom d\'utilisateur',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Votre Email',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Profile',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
           
              DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
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
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    labelText: 'Confirmation mot de passe',
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
              const SizedBox(
                height: 10,
              ),
              DelayedAnimation(
                delay: transitionAnimate,
                child: CustomButton("Envoyer", (() {
                    
                  })),
              ),
         
              // DelayedAnimation(
              //     delay: transitionAnimate,
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: InkWell(
              //         onTap: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => const WelcomeAuth()));
              //         },
              //         child: Column(
              //          mainAxisAlignment: MainAxisAlignment.center,
                       
              //           children: const [
              //             Text("Si vous avec déjà un compte?",
              //                 style: TextStyle(
              //                   color: Color(0xff1E232C),
              //                   fontSize: 15,
              //                 )),
              //             Text(" Connectez vous ici",
              //                 style: TextStyle(
              //                   color: Color(0xff35C2C1),
              //                   fontSize: 15,
              //                 )),
              //           ],
              //         ),
              //       ),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}
