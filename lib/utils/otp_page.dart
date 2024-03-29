import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:pinput/pinput.dart';


class OptShareCode extends StatefulWidget {
  const OptShareCode({super.key});

  @override
  State<OptShareCode> createState() => _OptShareCodeState();
}

class _OptShareCodeState extends State<OptShareCode> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle:const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color:const Color.fromARGB(255, 93, 95, 97)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color:const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: grey1,
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: primaryColor,), onPressed: () { 
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
                
                 DelayedAnimation(delay: 1500,
               child: SizedBox(
                     child: SizedBox(
                  height: 170,
                  child: SvgPicture.asset("assets/reset_login.svg"),
                ),
               )),
                const SizedBox(height: 20,),
               DelayedAnimation(
                    delay: 1700,
                    child: Text(
                      'Vérification du téléphone',
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
                    delay: 1700,
                    child: Text(
                      'Nous devons enregistrer votre numéro pour commencer',
                      style: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,                     
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
           
                const SizedBox(
                  height: 25,
                ),
             DelayedAnimation(delay: 1500, 
             child:    Pinput(
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  validator: (s) {
                    return s == '2222' ? null : 'Code incorrect';
                  },
                  pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                ),),
                const SizedBox(
                  height: 20,
                ),
               const SizedBox(height: 20,),
                DelayedAnimation(delay: 1500, 
                  child: CustomButton("Envoyer", (() {
                    
                  })),
                ),
                const SizedBox(
                  height: 10,
                ),
                DelayedAnimation(
                    delay: 1700,
                    child: Text(
                      'Vous n\'avez pas reçu de code ?',
                      style: GoogleFonts.poppins(
                        color: secondaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
               

                DelayedAnimation(delay: 1500,
                 child:  TextButton(
                    onPressed: () {},
                    child:  Text(
                      'Resend',
                      style: GoogleFonts.poppins(
                        color: primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    )) ),
               
              ],
            ),
          ),
        ),
      
    );
  }
}
