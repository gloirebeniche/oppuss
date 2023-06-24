import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late AuthProvider authProvider;
  bool showPassword = false;
  final TextEditingController _usernameUpadeController = TextEditingController();
  final TextEditingController _firstnameUpadeController = TextEditingController();
  final TextEditingController _lastnameUpadeController = TextEditingController();
  final TextEditingController _emailUpadeController = TextEditingController();
  final TextEditingController _passwordUpadeController = TextEditingController();
  final TextEditingController _genderUpadeController = TextEditingController();
  final TextEditingController _telUpadeController = TextEditingController();
  final TextEditingController _adressUpadeController = TextEditingController();
  var p;


  Future<void> updateEmployeur(int? employeurId, Map<String, dynamic> updatedData) async {

    final apiUrl = '$apiGetEmployeurs$employeurId/'; 

    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(updatedData),
    );

    if (response.statusCode == 200) {
      setState(() {
        messageBoxSuccess(context, "Sauvegardé");
      });
    } else {
      print('Erreur lors de la mise à jour de l\'employeur');
      print('Code de statut : ${response.statusCode}');
      print('Réponse : ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
    setState(() {
      _usernameUpadeController.text = authProvider.currentUser!.username;
      _firstnameUpadeController.text = authProvider.currentUser!.firstName!;
      _lastnameUpadeController.text = authProvider.currentUser!.lastName!;
      _emailUpadeController.text = authProvider.currentUser!.email;
      _genderUpadeController.text = authProvider.currentUser!.gender!;
      _telUpadeController.text = authProvider.currentUser!.phoneNumber!;
      p = authProvider.currentUser!.password;
    });

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
              buildTextField("Non d'utilisateur", _usernameUpadeController.text, false, _usernameUpadeController),
              buildTextField("Prenom", _firstnameUpadeController.text, false, _firstnameUpadeController),
              buildTextField("Nom de la famille", _lastnameUpadeController.text, false, _lastnameUpadeController),
              buildTextField("E-mail", _emailUpadeController.text, false, _emailUpadeController),
              buildTextField("Password", "********", false, _passwordUpadeController),
              buildTextField("Civilité", _genderUpadeController.text, false, _genderUpadeController),
              buildTextField("Téléphone", _telUpadeController.text, false, _telUpadeController),
              buildTextField("Adresse de facturation", _adressUpadeController.text, false, _adressUpadeController),
              
              Column(
             
                children: [
                  defaultButton("Sauvegarder", (){
                     var data = {
                      'username' : _usernameUpadeController.text,
                      "password" : _passwordUpadeController.text.isEmpty ? p : _passwordUpadeController.text,
                      'prenom' : _firstnameUpadeController.text,
                      'nom' : _lastnameUpadeController.text,
                      'email' : _emailUpadeController.text,
                      'civilite' : _genderUpadeController.text,
                      'tel': _telUpadeController.text,
                      'adress' : _adressUpadeController.text
                     };

                     updateEmployeur(authProvider.currentUser?.id, data);
                     authProvider.getCurrentUser(authProvider.accessToken!);
                  })
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField, TextEditingController c) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        controller: c,
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