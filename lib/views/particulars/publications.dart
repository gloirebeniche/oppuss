import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/ref_btp.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/auth/login_screen.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddOffer extends StatefulWidget {
  const AddOffer({super.key});

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  
  TextEditingController inputDescription = TextEditingController();
  
  TextEditingController inputDate = TextEditingController();
  
  TextEditingController inputHour = TextEditingController();
  
  TextEditingController inputAdress = TextEditingController();

  TextEditingController inputTel = TextEditingController();
  
  List<Domaine> _domaines = [];

  List<Travaux> _travaux = [];

  int? id_domaine;

  int? id_travaux;


  Future<void> fetchData() async {

    try {
      final response = await http.get(Uri.parse(apiDomaines));
      if (response.statusCode == 200) {
        // Permettre au donnée d'accepter les caractère spéciaux
        var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        List<Domaine> newData = [];
        for (var item in jsonData) {
          newData.add(Domaine.fromJson(item));
        }
        setState(() {
          _domaines = newData;
          id_domaine = _domaines[0].id;
        });
      } else {
        // Gérer les erreurs lors de l'appel à l'API
        print('Erreur de récupération des données depuis l\'API');
      }
    } catch (e) {
      
    }
    
  }

  @override
  void initState()  {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return !authProvider.isAuthenticated? const LoginScreen() : Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){ Navigator.pop(context); },
          icon: Icon(EvaIcons.close, color: black, size: 35,),
        ),
        title: customeTextStyle("Nouvelle demande", black),
        backgroundColor: white,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            //color: Colors.grey.shade200,
            child: FormHelper.dropDownWidget(
              context,
              "Quelle est le domaine d'activité ?",
              id_domaine,
              _domaines,
              (onChanged){
                id_domaine = onChanged;
                
              },
              (onValidate){
                if (onValidate == null) {
                  return "Please select country";
                }
                return null;
              },
              borderColor: grey,
              borderFocusColor: primaryColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "nom_domaine"
            ),
          ),

          // Container(
          //   margin: const EdgeInsets.only(top: 20),
          //   child: FormHelper.dropDownWidget(
          //     context,
          //     "Quel est le type de travaux à réaliser ?",
          //     id_travaux,
          //     _travaux,
          //     (onChangedVal){
          //       id_travaux = onChangedVal;
          //     },
          //     (onValidate){
          //       if (onValidate == null) {
          //         return "Please select travaux";
          //       }
          //       return null;
          //     },
          //     borderColor: grey,
          //     borderFocusColor: primaryColor,
          //     borderRadius: 10,
          //     optionValue: "id",
          //     optionLabel: "nom_travaux"
          //   ),
          // ),

          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 50,
            child: TextField(
              controller: inputDate,
              minLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: icon(EvaIcons.calendarOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: TextStyle(fontSize: 21, color: grey2)),
                hintText: "Quel jour vous convient le mieux ?"
              ),
              onTap: () async{
                DateTime? pickeddate = await showDatePicker(
                  context: context, 
                  initialDate: DateTime.now(), 
                  firstDate: DateTime.now(), 
                  lastDate: DateTime(2100)
                );

                if (pickeddate != null) {
                  setState(() {
                    inputDate.text = DateFormat("dd/MM/yyyy").format(pickeddate);
                  });
                }
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: inputHour,
              minLines: 1,
              maxLines: 2,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: icon(EvaIcons.clockOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle:  TextStyle(fontSize: 12, color: grey2)),
                hintText: "Quel est l'heure qui vous convient ?"
              ),
              onTap: () async{
                TimeOfDay? time = await showTimePicker(
                  context: context, 
                  initialTime: TimeOfDay.now());

                if (time != null) {
                  setState(() {
                    inputHour.text = time.format(context).toLowerCase();
                  });
                }
              },
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: inputAdress,
              keyboardType: TextInputType.streetAddress,
              minLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: icon(EvaIcons.pinOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: TextStyle(fontSize: 15, color: grey2)),
                hintText: "Quelle est l'adresse de la prestation ?"
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: inputTel,
              keyboardType: TextInputType.phone,
              minLines: 1,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: icon(EvaIcons.phoneOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: TextStyle(fontSize: 15, color: grey2)),
                hintText: "À quel numéro êtes-vous joignable en cas de besoins ?"
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 15),
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller: inputDescription,
              keyboardType: TextInputType.text,
              minLines: 5,
              maxLines: 10,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: icon(EvaIcons.clockOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle:  TextStyle(fontSize: 15, color: grey2, height: 3)),
                hintText: "Détail supplementaire (optionnel)"
              ),
            ),
          ),
          
          Container(
            padding: padding,
            child: defaultButton("Publier l'offre", (){}),
          )
        ],
      ),
    );
  }
}