import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/models/ref_btp.dart';
import 'package:oppuss/utils/theme.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:oppuss/views/particulars/publier/add_travaux.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddOffer extends StatefulWidget {
  const AddOffer({super.key});

  @override
  State<AddOffer> createState() => _AddOfferState();
}

class _AddOfferState extends State<AddOffer> {
  
  List<Domaine> domaines = [];

  List<Domaine> domaineFilters = [];
  String? idDomaine;
  String? stateId;

  void updateList(String value){
    //this is the function that filter our liste
    setState(() {
      domaineFilters = domaines.where(
        (element) => element.nomdomaine!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  Future<void> fetchData() async {
    try {
      // appele à l'api pour récuperer les domaine metier
      var response = await http.get(Uri.parse(apiDomaines));

      if (response.statusCode == 200) {
        // Permettre au donnée d'accepter les caractère spéciaux
        var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        
        List<Domaine> newData = [];
        for (var item in jsonData) {
          newData.add(Domaine.fromJson(item));
        }

        setState(() {
          domaines = newData; // Mettre à jour l'état avec les nouvelles données
          domaineFilters = domaines;
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
        leading: IconButton(
          onPressed: (){ Navigator.pop(context); },
          icon: const Icon(EvaIcons.close, color: white, size: 35,),
        ),
        title: customeTextStyle("", black),
        elevation: 0,
        backgroundColor: Colors.blueGrey.shade600,
      ),
      body: Column(
        children: [
          customeTextStyle("Choisir", white, size: 25, fontWeight: FontWeight.bold),
          customeTextStyle("un domaine BTP", white, size: 25, fontWeight: FontWeight.bold),
          Container(
            margin: margin,
            child: TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: icon(EvaIcons.searchOutline),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                ),
                hintStyle: GoogleFonts.lato(textStyle: const TextStyle(fontSize: 13, color: black)),
                hintText: "Rechercher un domaine BTP"
              ),
            ),
          ),
          
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  Center(
                    child: Wrap(
                      children: [
                        for(var domaine in domaineFilters)
                          GestureDetector(
                            onTap: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setString('id_domaine', domaine.id.toString());
                              //context.go("/home/add_offer/add_travaux/${domaine.id}");
                              Get.to(() => AddTravaux(idDomaine: domaine.id,), transition: Transition.rightToLeft, duration: const Duration(milliseconds: durationAnime));
                            },
                            child: Container(
                              margin: margin,
                              width: MediaQuery.of(context).size.height * 0.20,
                              height: MediaQuery.of(context).size.height * 0.20,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(domaine.image!),
                                  fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(15)
                              ),
                              child: Center(child: customeTextStyle(domaine.nomdomaine!, white, fontWeight: FontWeight.bold, align: TextAlign.center, size: headingTextSize)),
                            ),
                          )
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