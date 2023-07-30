// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/account.dart';
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
  bool showPassword = false;
  late int idEmployeur;
  final TextEditingController _usernameUpadeController = TextEditingController();
  final TextEditingController _firstnameUpadeController = TextEditingController();
  final TextEditingController _lastnameUpadeController = TextEditingController();
  final TextEditingController _emailUpadeController = TextEditingController();
  final TextEditingController _passwordUpadeController = TextEditingController();
  final TextEditingController _genderUpadeController = TextEditingController();
  final TextEditingController _telUpadeController = TextEditingController();
  final TextEditingController _adressUpadeController = TextEditingController();
  var p;
  
  late AuthProvider authProvider;


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
      setState(() {
        messageBox(context, "ERROR : Imposible de faire la mise à jour");
      });
    }
  }

  Future<Employeur> fetchData(String token) async {
    try {
      final response = await http.get(
        Uri.parse(apiGetCurrentUser),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode != 200) {
        throw("Token not valid");
      }
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      return Employeur.fromJson(jsonData);
    } catch (e) {
      throw("Connection failed");
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    Employeur employeur = await fetchData(authProvider.accessToken!);
    idEmployeur = employeur.id;
    _usernameUpadeController.text = employeur.username;
    _firstnameUpadeController.text = employeur.firstName ?? '';
    _lastnameUpadeController.text = employeur.lastName ?? '';
    _emailUpadeController.text = employeur.email;
    _genderUpadeController.text = employeur.gender ?? '';
    _telUpadeController.text = employeur.phoneNumber ?? '';
    _adressUpadeController.text = employeur.address ?? '';
    p = employeur.password;
  }

  @override
  Widget build(BuildContext context) {
    authProvider = Provider.of<AuthProvider>(context);
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
                  defaultButton("Sauvegarder", () async {
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

                     showDialog(context: context, builder: (context){
                        return Center(child: LoadingAnimationWidget.inkDrop(color: primaryColor, size: 50),);
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      updateEmployeur(idEmployeur, data);
                      Navigator.pop(context);
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