import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Utilisez la clé correspondante à votre objet dans le cache
    var myObject = prefs.getString('myObjectKey');

    if (myObject != null) {
      // Faites quelque chose avec l'objet récupéré du cache
      print('Objet récupéré du cache : $myObject');
    } else {
      // L'objet n'a pas été trouvé dans le cache
      print('Objet non trouvé dans le cache');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: white,
      appBar: CustomAppBar2("Information personnelles", context),
      body: Container(
        padding: padding,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              buildTextField("Non d'utilisateur", authProvider.currentUser?.username??'', false),
              buildTextField("Prenom", authProvider.currentUser?.firstName??'', false),
              buildTextField("Nom de la famille", authProvider.currentUser?.lastName??'', false),
              buildTextField("E-mail", authProvider.currentUser?.email??'', false),
              buildTextField("Password", "********", true),
              buildTextField("Civilité", authProvider.currentUser?.gender??'', false),
              buildTextField("Téléphone", authProvider.currentUser?.phoneNumber??'', false),
              buildTextField("Adresse de facturation", authProvider.currentUser?.address??'', false),
              
              Column(
             
                children: [
                  defaultButton("Sauvegarder", (){})
                
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        style: GoogleFonts.lato(
          color: black,
          fontSize: 15
        ),
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: GoogleFonts.lato(
              color: black,
              fontSize: 13
            )),
      ),
    );
  }
}