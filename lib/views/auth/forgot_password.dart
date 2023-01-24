import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/otp_page.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';

import 'login_screen.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
   TextEditingController countrycode = TextEditingController();

  @override
  void initState() {
     countrycode.text = "+242";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
           appBar: AppBar(
            backgroundColor: kglobalColor,
            elevation: 0,
            leading: IconButton(icon: const Icon(Icons.arrow_back,color: kPrimaryColor,), onPressed: () { 
                  // Navigator.push(
                  //             context,
                  //             MaterialPageRoute(
                  //                 builder: (context) =>  const LoginScreen()));
            Navigator.pop(context);

         },),
      ),
      body: SingleChildScrollView(  
        child: Container(
            margin: const EdgeInsets.symmetric(
            vertical: 60,
            horizontal: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 
              DelayedAnimation(delay: transitionAnimate,
               child: SizedBox(
                     child: SizedBox(
                  height: 170,
                  child: SvgPicture.asset("assets/reset_login.svg"),
                ),
               )),
              const SizedBox(height: 20,),
                 DelayedAnimation(
                    delay: transitionAnimate,
                    child: Text(
                      'Vérification du téléphone',
                      style: GoogleFonts.poppins(
                        color: kPrimaryColor,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                     const SizedBox(height: 20,),
                 DelayedAnimation(
                    delay: transitionAnimate,
                    child: Text(
                      'Nous devons enregistrer votre numéro pour commencer',
                      style: GoogleFonts.poppins(
                        color: KTextColorSecondary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,                     
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
           
              const SizedBox(height: 20,),
            DelayedAnimation(delay: transitionAnimate,
             child:     Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 18,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                          controller: countrycode,
                          decoration: const InputDecoration(border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly
                          ]),
                    ),
                    const Text(
                      '|',
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Numéro"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    )
                  ],
                ),
              ),),
             
           
          
              const SizedBox(height: 20,),
               DelayedAnimation(delay: transitionAnimate, 
              child: CustomizedButton(
                  buttonText: "envoyer le code",
                  buttonColor: kPrimaryColor,
                  textColor: Colors.white,
                  onPressed: () async {

                    // c'est dans cette methode qu'il faut synchroniser des les informations saisies par
                    // par l'utilisateur pour les envoyer dans l'API

                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const OptShareCode()));
                  }),),
            ],
          ),
        ),
      ),
    );
  }
}