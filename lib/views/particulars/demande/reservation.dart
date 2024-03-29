import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/widget/button_widget_app.dart';
import 'package:oppuss/widget/customized_appbar.dart';

import '../../../api/api.dart';
import '../../../models/gestion_qualification.dart';


class ReservationView extends StatefulWidget {
  final dynamic worker_id;
  const ReservationView({super.key, required this.worker_id,});

  @override
  State<ReservationView> createState() => _ReservationViewState(worker_id);
}

class _ReservationViewState extends State<ReservationView> {
  dynamic id_worker = 0;

  _ReservationViewState(worker_id){ id_worker = worker_id;}

  Future<Staff> fetchData() async {
    // Appel API pour récupérer les données
    var response = await http.get(Uri.parse(apiGetWorkers + id_worker.toString()));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      Staff worker = Staff.fromJson(jsonData);
      return worker;
    } else {
      throw Exception('Erreur de récupération des données depuis l\'API');
    }
  }

  var selectedRadio;
  setSelectedRadio(val){
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  void initState() { 
    super.initState();
    selectedRadio = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2("", context),
      body: FutureBuilder<Staff>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LoadingAnimationWidget.staggeredDotsWave(color: primaryColor, size: 50),);
          } else if (snapshot.hasError) {
            return const Text('Erreur de récupération des données depuis l\'API');
          }else if(snapshot.hasData){
            Staff worker = snapshot.data!;
            return RefreshIndicator(
              onRefresh: fetchData,
              child: ListView(
                children: [
                  Container(
                    margin: margin,
                    child: customeTextStyle("Réservation de ${worker.nom}", black, fontWeight: FontWeight.bold, size: 20),
                  ),

                  Container(
                    margin: margin,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: white,
                    ),
                    child:  Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/worker.jpg"),
                          radius: 35,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeTextStyle("${worker.prenom} ${worker.nom}", black, fontWeight: FontWeight.bold, size: 17),
                              customeTextStyle(worker.metier.nomMetier, black),
                              
                              Row(
                                children: [
                                  const Icon(EvaIcons.briefcase),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: worker.anneeExperience > 1 ? customeTextStyle("${worker.anneeExperience} ans d'expériences",black) : customeTextStyle("Une année d'expérience",black),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  icon(EvaIcons.star, color: Colors.amber),
                                  customeTextStyle("4,8", black, fontWeight: FontWeight.bold, size: 18),
                                  customeTextStyle("(${worker.nombreDavis}) avis", grey2)
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: margin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customeTextStyle("Récapitulatif", black, fontWeight: FontWeight.bold, size: 18),
                        Container(
                          margin: margin,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              icon(EvaIcons.lockOutline, color: grey2),
                              customeTextStyle("Paiement sécurisé", grey2)
                            ],
                          ),
                        )
                      ],
                    )
                  ),

                  // Container(
                  //   margin: margin,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       customeTextStyle("Rémunération réservation", grey2),
                  //       customeTextStyle("500 F CFA", black, fontWeight: FontWeight.bold)
                  //     ],
                  //   ),
                  // ),

                  Container(
                    margin: margin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customeTextStyle("Frais de réservation", grey2),
                        customeTextStyle("500F CFA", black, fontWeight: FontWeight.bold)
                      ],
                    ),
                  ),

                  Container(
                    margin: margin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customeTextStyle("Montant total", grey2),
                        customeTextStyle(" 500F CFA", black, fontWeight: FontWeight.bold)
                      ],
                    ),
                  ),

                  Container(
                    margin: margin,
                    child: customeTextStyle("Moyen de paiement", black, fontWeight: FontWeight.bold, size: 20),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextButton(
                      onPressed: () {
                        Dialogs.bottomMaterialDialog(
                          title: 'Moyen de paiement',
                          context: context,
                          actions: [
                            Column(
                              children: [
                                Divider(height: 1, thickness: 1, color: grey,),
                                Row(
                                  children: [
                                    Radio(
                                      value: 1, 
                                      groupValue: selectedRadio,
                                      activeColor: primaryColor,
                                      onChanged: (val){setSelectedRadio(val); Navigator.pop(context);}
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 40,
                                      child: Image.asset("assets/paypal.png"),
                                    ),
                                    customeTextStyle("Paypal", black, fontWeight: FontWeight.bold)
                                  ],
                                ),

                                Divider(height: 1, thickness: 1, color: grey,),
                                Row(
                                  children: [
                                    Radio(
                                      value: 2, 
                                      groupValue: selectedRadio,
                                      activeColor: primaryColor,
                                      onChanged: (val){setSelectedRadio(val); Navigator.pop(context);}
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 40,
                                      child: Image.asset("assets/visa.png"),
                                    ),
                                    customeTextStyle("Visa / Mastercard", black, fontWeight: FontWeight.bold)
                                  ],
                                ),

                                Divider(height: 1, thickness: 1, color: grey,),
                                Row(
                                  children: [
                                    Radio(
                                      value: 3, 
                                      groupValue: selectedRadio,
                                      activeColor: primaryColor,
                                      onChanged: (val){setSelectedRadio(val); Navigator.pop(context);}
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 40,
                                      child: Image.asset("assets/maestro.png"),
                                    ),
                                    customeTextStyle("Maestro", black, fontWeight: FontWeight.bold)
                                  ],
                                ),

                                Divider(height: 1, thickness: 1, color: grey,),
                                Row(
                                  children: [
                                    Radio(
                                      value: 4, 
                                      groupValue: selectedRadio,
                                      activeColor: primaryColor,
                                      onChanged: (val){setSelectedRadio(val); Navigator.pop(context);}
                                    ),
                                    const CircleAvatar(
                                      radius: 15,
                                      backgroundImage: AssetImage("assets/momo.jpg"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: customeTextStyle("MTN Momo", black, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            )
                            
                          ]
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(0),
                            child: Row(
                              children: [
                                Icon(EvaIcons.creditCardOutline, color: primaryColor,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: customeTextStyle("Ajouter un mode de paiement", grey2),
                                )
                              ],
                            ),
                          ),
                  
                          icon(EvaIcons.chevronRightOutline, color: grey2)
                        ],
                      ),
                    ),
                  ),

                  Container(
                    margin: margin,
                    child: customeTextStyle("Ceci est un prépaiement, le montant n'est pas rembourser en cas d'annulation.", grey2),
                  ),

                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: customeTextStyle("Besoins d'une assistance", black, fontWeight: FontWeight.bold, size: 20),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: customeTextStyle("téléphonique ?", black, fontWeight: FontWeight.bold, size: 20),
                  ),

                  Container(
                    margin: margin,
                    child: Row(
                      children: [
                        Icon(EvaIcons.phoneCallOutline, size: 30, color: primaryColor,),
                        Container(
                          margin: margin,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customeTextStyle("Appeler le service client", primaryColor, fontWeight: FontWeight.bold, size: 18,),
                              customeTextStyle("Disponible de 9h à 18h du lundi au vendredi", grey2)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: margin,
                    child: defaultButton("Reserver", () { }),
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

