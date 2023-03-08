import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:intl/intl.dart';

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
  
  List<dynamic> _domaines = [];

  List<dynamic> _travaux = [];

  String? id_domaine;

  String? id_travaux;


  Future<void> fill_domaine() async {

    SharedPreferences  prefs =  await SharedPreferences.getInstance();

    setState(() {
      _domaines = jsonDecode(prefs.getString('domaines')!);
    });
    
  }

  @override
  void initState()  {
    super.initState();
    try {
       fill_domaine();
    } catch (e) {
      print(e); 
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){ Navigator.pop(context); },
          icon: const Icon(EvaIcons.close, color: black, size: 35,),
        ),
        title: appbarTextStyle("Nouvelle demande"),
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

                for (var element in _domaines) {
                  if (element['id'].toString() == onChanged.toString()) {
                    setState(() {
                      _travaux = element['travaux_set'];
                    });
                    print(_travaux);
                  }
                }

                for (var e in _travaux) {
                  print(e['nom_travaux']);
                }
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

          Container(
            margin: const EdgeInsets.only(top: 20),
            child: FormHelper.dropDownWidget(
              context,
              "Quel est le type de travaux à réaliser ?",
              id_travaux,
              _travaux,
              (onChangedVal){
                id_travaux = onChangedVal;
              },
              (onValidate){
                if (onValidate == null) {
                  return "Please select travaux";
                }
                return null;
              },
              borderColor: grey,
              borderFocusColor: primaryColor,
              borderRadius: 10,
              optionValue: "id",
              optionLabel: "nom_travaux"
            ),
          ),

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
                prefixIcon: icon2(EvaIcons.calendarOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: const TextStyle(fontSize: textSizeH2, color: grey2)),
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
                prefixIcon: icon2(EvaIcons.clockOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: const TextStyle(fontSize: textSizeH2, color: grey2)),
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
                prefixIcon: icon2(EvaIcons.pinOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: const TextStyle(fontSize: textSizeH2, color: grey2)),
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
                prefixIcon: icon2(EvaIcons.phoneOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: const TextStyle(fontSize: textSizeH2, color: grey2)),
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
                prefixIcon: icon2(EvaIcons.clockOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: const TextStyle(fontSize: textSizeH2, color: grey2, height: 3)),
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