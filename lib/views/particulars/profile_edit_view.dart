import 'package:flutter/material.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Information personnelles",
            style: TextStyle(fontSize: 20, color: Colors.black87),
          ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),  
      ),
      body: Container(
        padding: padding,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              buildTextField("Non d'utilisateur", "kbjeanelie", false),
              buildTextField("Prenom", "Elijah", false),
              buildTextField("Nom de la famille", "Walter", false),
              buildTextField("E-mail", "alexd@gmail.com", false),
              buildTextField("Password", "********", true),
              buildTextField("Civilité", "Homme", false),
              buildTextField("Téléphone", "064838870", false),
              buildTextField("Adresse de facturation", "242, rue bandza Ouendzé Brazzaville", false),
              
              Column(
             
                children: [
                  BtnCustom(
                    textColor: bgColor,
                    buttonColor: primaryColor,
                    buttonText: "Save",
                    onPressed: (){},
                  ),
                
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
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
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}