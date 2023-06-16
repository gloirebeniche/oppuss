import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';

import '../../widget/customized_appbar.dart';
import 'login_screen.dart';

class SignUpScreenOuvrier extends StatefulWidget {
  const SignUpScreenOuvrier({super.key});

  @override
  State<SignUpScreenOuvrier> createState() => _SignUpScreenOuvrierState();
}

class _SignUpScreenOuvrierState extends State<SignUpScreenOuvrier> {
  var _obscureText = true;
  final bool ispassword = true;

  var listProfileWorker = [
    '',
    'Ménuisier',
    'Mécanicier',
    'Electricien',
    'Maçon',
    'Charpentier',
    'Plombier',
    'Carreleur',
    'Autre'
  ];
  var dropValue = ValueNotifier('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
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
                delay: transitionAnimate,
                child: Text(
                  "Nous Rejoindre",
                  style: GoogleFonts.poppins(
                    color: primaryColor,
                    fontSize: appbarTextSize,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              DelayedAnimation(
                  delay: transitionAnimate,
                  child: TextFieldCustomized("Nom d\'utilisateur")),
              DelayedAnimation(
                delay: transitionAnimate,
                child: TextFieldCustomized("Votre Email"),
              ),
              DelayedAnimation(
                delay: transitionAnimate,
                child: ValueListenableBuilder(
                    valueListenable: dropValue,
                    builder: (BuildContext context, value, _) {
                      return SizedBox(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          hint: const Text('Votre Profession'),
                          value: (value.isEmpty) ? null : value,
                          onChanged: (onChanged) =>
                              dropValue.value = onChanged.toString(),
                          items: listProfileWorker
                              .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                              .toList(),
                        ),
                      );
                    }),
              ),
              DelayedAnimation(
                  delay: transitionAnimate,
                  child: TextFieldPassword("Mot de passe")),
              DelayedAnimation(
                  delay: transitionAnimate,
                  child: TextFieldPassword("'Confirmation mot de passe")),
              DelayedAnimation(
                delay: transitionAnimate,
                child: CustomButton("Envoyer", (() {})),
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
                        children: [
                          const Text("Si vous avec déjà un compte?",
                              style: TextStyle(
                                color: black,
                                fontSize: 11,
                              )),
                          
                          Text(" Connectez vous ici",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 12,
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

  TextField TextFieldCustomized(String title) {
    return TextField(
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: primaryColor),
        labelText: title,
        labelStyle:  TextStyle(color: grey, fontSize: 23),
      ),
    );
  }

  TextField TextFieldPassword(String password) {
    return TextField(
      obscureText: ispassword,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: primaryColor),
        labelStyle:  TextStyle(color: grey, fontSize: 23),
        labelText: password,
        suffixIcon: ispassword
            ? IconButton(
                icon: Icon(
                  Icons.remove_red_eye,
                  color: grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }

}
