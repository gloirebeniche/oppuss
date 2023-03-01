import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/user.dart';
import 'package:oppuss/utils/delayed_animation.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/forgot_password.dart';
import 'package:oppuss/views/welcome_screen.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:provider/provider.dart';
import '../../widget/customized_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    var _obscureText = true;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    getCurrentUser() async {
      // Récupérer le jeton d'accès à partir des préférences partagées
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');
      try {
        final http.Response response = await http.get(
          Uri.parse(api_get_current_user),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token', // inclure le jeton dans les en-têtes
          },
        );

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final User user = User.fromJson(responseData);
          // Stockage de l'utilisateur dans les préférences partagées
          prefs.setString('user', jsonEncode(user));

        } else {
          // Gestion de l'erreur
          print(response.statusCode);
        }
      } catch (e) {
        print(e);
      }

    }
    Future<bool> _login() async {
      final String email = _emailController.text.trim().replaceAll(" ", "");
      final String password = _passwordController.text.trim().replaceAll(" ", "");

      try {
        final http.Response response = await http.post(
          Uri.parse(api_login_view),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{"email":email,"password":password})
        );

        if (response.statusCode == 200) {
          //print("authentification réussit")
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final String? accessToken = responseData['token']['access'];
          final String? refreshToken = responseData['token']['refresh'];

          if (accessToken != null && refreshToken != null) {
            // Stockage des jetons dans les préférences partagées
            final SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('access_token', accessToken);
            prefs.setString('refresh_token', refreshToken);
            return true;
          } else {
            // Gestion de l'erreur
            print("Erreur lors de la récupération des jetons");
            return false;
          }
        }else{
          return false;
        } 
      } catch (e) {
        print(e);
        return false;
      }
    }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return  Scaffold(
      backgroundColor: bgColor,
      appBar: const CustomizeAppBar(colorAppBar: white, title: '',),
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
                () async{
                  if (await _login()) {
                    authProvider.checkAuth();
                    print(authProvider.currentUser?.email);
                    context.go("/home");
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
                     const  Text("Vous n'avez pas de compte ?",
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

  TextField TextFieldCustomized(String title) {
    return  TextField(
            controller: _emailController,
            decoration: InputDecoration(
              floatingLabelStyle: TextStyle(
                color: primaryColor
              ),
              labelText: title,
              labelStyle: const TextStyle(
                color: grey,
                fontSize: bigTextSize5
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
              labelStyle:  const TextStyle(
                color: grey,
                fontSize: bigTextSize5
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