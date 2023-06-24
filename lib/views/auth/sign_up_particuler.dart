// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreenParticuler extends StatefulWidget {
  const SignUpScreenParticuler({super.key});

  @override
  State<SignUpScreenParticuler> createState() => _SignUpScreenParticulerState();
}

class _SignUpScreenParticulerState extends State<SignUpScreenParticuler> {
 
  var _obscureText = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  //final TextEditingController _telController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();

  Future<bool> createUser() async {
    final String email = _emailController.text.trim().replaceAll(" ", "");
    final String username = _usernameController.text.trim().replaceAll(" ", "");
    //final String tel = _telController.text.trim().replaceAll(" ", "");
    final String password = _passwordController.text.trim().replaceAll(" ", "");
    final String password2 = _password2Controller.text.trim().replaceAll(" ", "");

    if (email.isEmpty || username.isEmpty || password.isEmpty || password2.isEmpty) {
      setState(() {
        messageBox(context, "Veillez remplir tous les champs");
      });
      return false;
    }else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)){
      setState(() {
        messageBox(context, "Veillez entrer une adresse mail valid");
      });
      return false;
    }else if(password != password2){
      setState(() {
        messageBox(context, "Les mot de passe ne correspondent pas");
      });
      return false;
    }else{
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      authProvider.register(email, username, password);
      return true;
    } 

  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      //appBar: CustomAppBar2("", context),
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
                  controller: _usernameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Nom d'utilisateur",
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Votre Email',
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              // DelayedAnimation(
              //   delay: transitionAnimate,
              //   child: TextField(
              //     controller: _telController,
              //     keyboardType: TextInputType.phone,
              //     decoration: InputDecoration(
              //       labelText: 'Télephone',
              //       labelStyle: TextStyle(
              //         color: Colors.grey[400],
              //       ),
              //     ),
              //   ),
              // ),
           
              DelayedAnimation(
                delay: transitionAnimate,
                child: TextField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
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
                  controller: _password2Controller,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                    labelText: 'Confirmationdu mot de passe',
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
                child: CustomButton("S'inscrire", (
                  () async {
                    if (await createUser()) {
                      print("ok");
                      showDialog(context: context, builder: (context){
                       return Center(child: CircularProgressIndicator(color: primaryColor,));
                      });
                      
                      await Future.delayed(const Duration(seconds: 2));
                      
                      Navigator.pop(context);
                      messageBoxSuccess(context, "Votre compte a été créer avec succèss :)");
                      
                      context.go("/home/login");
                    }
                    
                })),
              ),
         
              DelayedAnimation(
                  delay: transitionAnimate,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                      },
                      child: const Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       
                        children: [
                          Text("Si vous avec déjà un compte?",
                              style: TextStyle(
                                color: Color(0xff1E232C),
                                fontSize: 15,
                              )),
                          Text(" Connectez vous ici",
                              style: TextStyle(
                                color: Color(0xff35C2C1),
                                fontSize: 15,
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
