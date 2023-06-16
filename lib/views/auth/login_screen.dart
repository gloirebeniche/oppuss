// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/forgot_password.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:provider/provider.dart';
import '../../widget/customized_appbar.dart';
// ignore: depend_on_referenced_packages
// import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    var _obscureText = true;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
  

  bool isEmailValid(String email) {
    // Expression régulière pour vérifier le format de l'adresse e-mail
    RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)*[a-zA-Z]{2,}$');
    
    // Vérifie si la chaîne de caractères correspond à l'expression régulière
    if (regex.hasMatch(email)) {
      return true; // L'adresse e-mail est valide
    } else {
      return false; // L'adresse e-mail est invalide
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return  Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar2("", context),
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
                  
           DelayedAnimation(
            delay: transitionAnimate,
            child:  TextFieldCustomized("Email"),
          ),
            DelayedAnimation(
            delay: transitionAnimate,
            child: TextFieldPassword("mode de passe"),
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

              //========================== Bouton de connexion =======================
              child: CustomButton("Connexion",
                () async {
                  if (isEmailValid(_emailController.text.trim()) && _passwordController.text.trim().isNotEmpty) {
                    if(await authProvider.login(_emailController.text, _passwordController.text)){
                      showDialog(context: context, builder: (context){
                        return Center(child: CircularProgressIndicator(color: primaryColor,));
                      });
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.pop(context);
                      setState(() {
                        messageBoxSuccess(context, "Vous êtes maintenant connecté :)");
                      });
                      context.go("/home");
                    }else{
                      setState(() {
                        messageBox(context, "username or password incorect");
                      });
                    }
                    
                  }
                }
              ),),
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
                    color: white,
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
                    color: white,
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
              //    DelayedAnimation(delay: transitionAnimate, 
              //           child:Padding(
              //           padding: const EdgeInsets.all(8.0),
              //         child: InkWell(
              //             onTap: () {
              //               context.go("/home/Employeur_register");
              //             },
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children:  [
              //        const  Text("Vous n'avez pas de compte ?",
              //             style: TextStyle(
              //               color: Color(0xff1E232C),
              //               fontSize: textSize,
              //             )),
              //         Text(" S'inscrire ici",
              //             style: TextStyle(
              //               color: primaryColor,
              //               fontSize: textSize,
              //             )),
              //       ],
              //     ),
              //   ),
              // ))
            ],
          ),
        ),
      ),
    );
  }

  TextField TextFieldCustomized(String title) {
    return  TextField(
            controller: _emailController,
            decoration: InputDecoration(
              floatingLabelStyle: TextStyle(
                color: primaryColor
              ),
              labelText: title,
              labelStyle: TextStyle(
                color: grey,
                fontSize: textSize
              ),
            ),
          );
  }

TextField TextFieldPassword(String password) {
    return TextField(
            controller: _passwordController,
            obscureText: _obscureText,
            decoration: InputDecoration(
                floatingLabelStyle: TextStyle(
                color: primaryColor
              ),
              labelStyle:  TextStyle(
                color: grey,
                fontSize: 20
              ),
              labelText: password,
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
               );
  }

}