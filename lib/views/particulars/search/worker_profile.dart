// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, no_logic_in_create_state, must_be_immutable

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/gestion_qualification.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/fullsreen.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class WorkerProfile extends StatelessWidget {
  final dynamic worker_id;
   WorkerProfile({super.key, required this.worker_id});


    Future<Worker> fetchData() async {
      // Appel API pour récupérer les données
      var response = await http.get(Uri.parse(apiGetWorkers + worker_id));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        Worker worker = Worker.fromJson(jsonData);
        return worker;
      } else {
        throw Exception('Erreur de récupération des données depuis l\'API');
      }
    }

    @override
    Widget build(BuildContext context) {
      // Récupérez les paramètres de l'URL
      final authProvider = Provider.of<AuthProvider>(context);
      return Scaffold(
        appBar: CustomAppBar2("", context),
        backgroundColor: Colors.grey.shade300,
        body: !authProvider.isAuthenticated? cardAuth(context) :
        FutureBuilder<Worker>(
          future: fetchData(),
          builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingScreen();
              } else if (snapshot.hasError) {
                return const Text('Erreur de récupération des données depuis l\'API');
              }else if(snapshot.hasData){
                Worker worker = snapshot.data!;
                return RefreshIndicator(
                  onRefresh: fetchData,
                  child: ListView(
                    children: [

                      //GRANDE IMAGE ET PHOTO DE PROFIL DE L'OUVRIER
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.23,
                            color: white,
                          ),
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.15,
                            decoration: const BoxDecoration(
                              image: DecorationImage(image: AssetImage("assets/bg-user.jpg"), fit: BoxFit.cover)
                            ),
                          ),
                          const Positioned(
                            top: 90,
                            left: 20,
                            child: CircleAvatar(
                              backgroundImage: AssetImage("assets/worker.jpg"),
                              radius: 45,
                            ),
                          )
                        ],
                      ),

                      // CETTE PARTIE CONCERNE LES INFORMATION PERSONNELLE DE L'OUVRIER
                      Container(
                        color: white,
                        padding: padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customeTextStyle("${worker.prenom} ${worker.nom.toUpperCase()}",black, fontWeight: FontWeight.bold),
                            customeTextStyle(worker.metier.nomMetier, black),
                            customeTextStyle(worker.adress!,black),
                            customeTextStyle("${worker.nombreJobs.toString()} Travaux réalisé",black, fontWeight: FontWeight.bold),
                            defaultButtonOutlined("Message", (){context.go("/home/message");})
                          ],
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 25, top: 15),
                              color: white,
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 5),
                              child: customeTextStyle("À propos", size:appbarTextSize, black)),
                            Container(
                              color: white,
                              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: customeTextStyle(" Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. ", 
                                black),
                              ),
                            ),

                            // CETTE PARTIE CONCERNE LES EXPERIENCE
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              color: white,
                              width: double.infinity,
                              padding: padding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeTextStyle("Expérience", size:appbarTextSize, black),
                                  worker.experiences.isEmpty ? 
                                  Container( 
                                    margin: const EdgeInsets.only(top: 10),
                                    child: customeTextStyle("${worker.prenom} ${worker.nom.toUpperCase()} n'a enregistré aucune expérience", grey2, size: 15, align: TextAlign.center))
                                  :ListView.builder(
                                    itemCount: worker.experiences.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return experience_card();
                                    },
                                  ),
                                ]
                              ),
                            ),

                            // CETTE PARTIE CONCERNE LES LICENSE ET CERTIFICATION
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              color: white,
                              width: double.infinity,
                              padding: padding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeTextStyle("Licences & Certifications",size:appbarTextSize, black),
                                  worker.formations.isEmpty ? 
                                  Container( 
                                    margin: const EdgeInsets.only(top: 10),
                                    child: customeTextStyle("${worker.prenom} ${worker.nom.toUpperCase()} n'a enregistré aucune licence ou certification", grey2, size: 15, align: TextAlign.center))
                                  :ListView.builder(
                                    itemCount: worker.formations.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return certification_card();
                                    },
                                  ),
                                ]
                              ),
                            ),

                            // CETTE PARTIE CONCERNE LES COMPETENCES
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              color: white,
                              width: double.infinity,
                              padding: padding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeTextStyle("Compétences professionel", size:appbarTextSize, black),
                                  Wrap(
                                    children: [
                                      worker.competences.isEmpty ? 
                                      Container( 
                                        margin: const EdgeInsets.only(top: 10),
                                        child: customeTextStyle("${worker.prenom} ${worker.nom.toUpperCase()} n'a enregistré de compétence profesionnel", grey2, size: 15, align: TextAlign.center))
                                      :ListView.builder(
                                        itemCount: worker.competences.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return competences(worker.competences[index].competence);
                                        },
                                      ),
                                    ],
                                  )
                                ]
                              ),
                            ),
                            
                            // CETTE PARTS CONCERNE LES AVIS ET COMMENTAIRE
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              color: white,
                              width: double.infinity,
                              padding: padding,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customeTextStyle("Avis & Commentaire", size:appbarTextSize, black),
                                  testimonyWidget(),
                                  Divider(thickness: 0.5, color: grey),
                                  testimonyWidget(),
                                  Divider(thickness: 0.5, color: grey),
                                  testimonyWidget(),
                                  Divider(thickness: 0.5, color: grey),
                                  testimonyWidget(),
                                  Divider(thickness: 0.5, color: grey),
                                  testimonyWidget(),
                                  Divider(thickness: 0.5, color: grey),
                                  testimonyWidget(),
                                  Divider(thickness: 0.5, color: grey),
                                  testimonyWidget(),
                                  Divider(thickness: 0.5, color: grey),
                                  testimonyWidget(),
                                  Divider(thickness: 0.5, color: grey),
                                  testimonyWidget(),
                                ]
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }else {
                return const Text('Aucune donnée disponible');
              }
          }
        ),
      );
    }
}


Container experience_card(){
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: Image(image: AssetImage("assets/firm.png")),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("Plombier", black, fontWeight: FontWeight.bold),
                customeTextStyle("SOGECOP : CDD", black),
                customeTextStyle("déc.2022 - janv 2023", black),
                customeTextStyle("Brazzaville, République du Congo", black),
                customeTextStyle("Description: ici", black),
              ],
            ),
          ),
        )
      ],
    ),
  );
}



Container certification_card(){
  return Container(
    margin: const EdgeInsets.only(top: 20),
    child: Row(
      children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: Image(image: AssetImage("assets/univ3.png")),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customeTextStyle("L'essentiel de Python 3", black, fontWeight: FontWeight.bold),
                customeTextStyle("Par : LinkedIn", black),
                customeTextStyle("Diplôme : Licence", black),
                customeTextStyle("Domaine d'étude : Génie Logiciel", black),
                customeTextStyle("Date de délivrance : mai 2023",  black),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Container testimonyWidget(){
  return Container(
    margin: const EdgeInsets.only(top: 15),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                backgroundImage: AssetImage("assets/user.png"),
                radius: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: customeTextStyle("Philippe", black, fontWeight: FontWeight.bold),
              ),
              const Icon(EvaIcons.star, color: Colors.amber, size: 20,),
              const Icon(EvaIcons.star, color: Colors.amber, size: 20,),
              const Icon(EvaIcons.star, color: Colors.amber, size: 20,),
              const Icon(EvaIcons.star, color: Colors.amber, size: 20,)
              ],
            ),
            customeTextStyle("il y a 7 jours", grey)
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: customeTextStyle("Philipe a été d'un professionnaliste incroyable! Il a été très agréable également. Il a vraiment du coeur à réaliser un travail impécable. Nousle recommandons chaleureusement et les yeux fermés",
          black),
        )
      ],
    )
  );
}
