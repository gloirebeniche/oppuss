import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/models/gestion_qualification.dart';
import 'package:oppuss/models/worker.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:oppuss/widget/particular/card_view.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class SearchWorkerView extends StatefulWidget {
  const SearchWorkerView({super.key});

  @override
  State<SearchWorkerView> createState() => _SearchWorkerViewState();
}


class _SearchWorkerViewState extends State<SearchWorkerView> {
  //create a dummy list
  static List<Worker> workers = [];

  List<Worker> displayWorker = List.from(workers);


  // void updateList(String value){
  //   //this is the function that filter our liste
  //   setState(() {
  //     display_list = workers.where(
  //       (element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
  //   });
  // }
  Future<void> fetchData() async {
    // Appel API pour récupérer les données
    var response = await http.get(Uri.parse(apiGetWorkers));
    if (response.statusCode == 200) {
      // Permettre au donnée d'accepter les caractère spéciaux
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      List<Worker> newData = [];
      for (var item in jsonData) {
        newData.add(Worker.fromJson(item));
      }
      setState(() {
        workers = newData;
        displayWorker = workers;
      });
      print(displayWorker);
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
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(top: 5),
          height: 50,
          child: TextField(
              onChanged: (value) => "",
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
      body: Padding(
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
                          cardWorker(displayWorker[index].username, displayWorker[index].anneeExperience, displayWorker[index].metier.nomMetier, displayWorker[index].nombreDavis),
                          // SearchWorkerCardView(
                          //   fullname: "${display_list[index].firstname} ${display_list[index].name}",
                          //   avis: display_list[index].avis,
                          //   jobs: display_list[index].jobs,
                          // ),
                          defaultButton("Voir le profil", (){context.go("/home/worker_profile");})
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

