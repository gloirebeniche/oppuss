// ignore_for_file: depend_on_referenced_packages

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/models/gestion_qualification.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'worker_profile.dart';



class SearchWorkerView extends StatefulWidget {
  const SearchWorkerView({super.key});

  @override
  State<SearchWorkerView> createState() => _SearchWorkerViewState();
}


class _SearchWorkerViewState extends State<SearchWorkerView> {
  late bool isLoading;
  //create a dummy list
  static List<Staff> workers = [];

  List<Staff> displayWorker = List.from(workers);


  void updateList(String value){
    //this is the function that filter our liste
    setState(() {
      displayWorker = workers.where(
        (element) => element.nom.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }
  
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    // Appel API pour récupérer les données
    var response = await http.get(Uri.parse(apiGetWorkers));
    if (response.statusCode == 200) {
      // Permettre au donnée d'accepter les caractère spéciaux
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      List<Staff> newData = [];
      for (var item in jsonData) {
        newData.add(Staff.fromJson(item));
      }
      setState(() {
        workers = newData;
        displayWorker = workers;
        Future.delayed(const Duration(seconds: 3));
        isLoading = false;
      });
    } else {
      // Gérer les erreurs lors de l'appel à l'API
      print('Erreur de récupération des données depuis l\'API');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey1,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(top: 5),
          height: 50,
          child: TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade200,
                prefixIcon: icon(EvaIcons.searchOutline, color: primaryColor),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50)
                ),
                hintStyle: GoogleFonts.lato(textStyle: TextStyle(fontSize: headingTextSize, color: grey2)),
                hintText: "Recherchez un ouvrier"
              ),
            ),
        ),
      ),
      body: isLoading? Center(child: LoadingAnimationWidget.staggeredDotsWave(color: primaryColor, size: 50),)
      : Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
              Expanded(
                child: displayWorker.isEmpty ?
                 Center(
                  child: customeTextStyle("Aucun ouvrier ne correspond ", black),
                )
                :ListView.builder(
                  itemCount: displayWorker.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Container(
                      padding: padding,
                      color: white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          cardWorker("${displayWorker[index].prenom} ${displayWorker[index].nom.toUpperCase()}",
                          displayWorker[index].anneeExperience, displayWorker[index].metier.nomMetier, displayWorker[index].nombreDavis),
                          defaultButton("Voir le profil", (){
                            Get.to(() => WorkerProfile(worker_id: displayWorker[index].id,), transition: Transition.rightToLeftWithFade, duration: const Duration(milliseconds: durationAnime));
                          })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

