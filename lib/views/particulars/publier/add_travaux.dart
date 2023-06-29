// ignore_for_file: unnecessary_brace_in_string_interps, no_logic_in_create_state

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/models/ref_btp.dart';
import 'package:oppuss/utils/theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oppuss/views/particulars/publier/add_day.dart';
//import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTravaux extends StatefulWidget {
  final dynamic idDomaine;
  const AddTravaux({super.key, required this.idDomaine});

  @override
  State<AddTravaux> createState() => _AddTravauxState(idDomaine);
}

class _AddTravauxState extends State<AddTravaux> {

  List<Travaux> travaux = [];
  dynamic id;

  _AddTravauxState(idDomaine){id = idDomaine;}

  Future<void> fetchData() async {
    try {
      var response = await http.get(Uri.parse("$apiTravaux/${id.toString()}/by_domaine/"));

      if (response.statusCode == 200) {
        // Permettre au donnée d'accepter les caractère spéciaux
        var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        
        List<Travaux> newData = [];
        for (var item in jsonData) {
          newData.add(Travaux.fromJson(item));
        }

        setState(() {
          travaux = newData; // Mettre à jour l'état avec les nouvelles données
        });
      }

    } catch (e) {
      throw("ERROR : Connexion au serveur échoué");
    }
  }

  @override
  void initState()  {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    //final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade600,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade600,
      ),
      body: Column(
        children: [
          customeTextStyle("Quelle travaux", white, size: 25, fontWeight: FontWeight.bold),
          customeTextStyle("souhaitez-vous réalisé ?", white, size: 25, fontWeight: FontWeight.bold),
          
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: ListView(
                children: [
                  Center(
                    child: Wrap(
                      children: [
                        for(var item in travaux)
                          Container(
                            margin: margin,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: white,),
                            child: TextButton(
                              onPressed: () async {
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                prefs.setString('id_travaux', item.id.toString());
                                Get.to(() => AddDay(), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: durationAnime));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  customeTextStyle(item.nomtravaux!, black, fontWeight: FontWeight.bold, align: TextAlign.center, size: headingTextSize),
                                  icon(EvaIcons.arrowIosForward)
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}