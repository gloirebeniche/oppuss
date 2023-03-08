import 'dart:convert';

import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: CustomAppBar("Publication", context),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
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

            Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: customeTextStyle("Quel jour vous convient le mieux ?", headingTextSize, black, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: inputDate,
                minLines: 1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1.5, color: grey),
                    borderRadius: BorderRadius.circular(10)
                  )
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

            
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: customeTextStyle("Quel est l'heure qui vous convient ?", headingTextSize, black, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: inputHour,
                minLines: 1,
                maxLines: 2,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1, color: grey),
                    borderRadius: BorderRadius.circular(10)
                  )
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

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: customeTextStyle("Quelle est l'adresse de la prestation ?", headingTextSize, black, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: inputAdress,
                minLines: 1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1.5, color: grey),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),

             Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: customeTextStyle("À quel numéro êtes-vous joignable en cas de besoins ?", headingTextSize, black, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: inputTel,
                minLines: 1,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1.5, color: grey),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
              child: customeTextStyle("Détail supplementaire (optionnel)", headingTextSize, black, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15),
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                controller: inputDescription,
                minLines: 3,
                maxLines: 7,
                decoration: InputDecoration(
                  labelText: 'Description',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 1.5, color: grey),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
            ),
            Container(
              padding: padding,
              child: defaultButton("Publier l'offre", (){}),
            )
          ],
        ),
      ),
    );
  }
}