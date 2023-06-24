import 'package:flutter/material.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/gestion_offres.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/fullsreen.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';


class OfferMoreDetailPage extends StatelessWidget {
  final dynamic idOffre;
  const OfferMoreDetailPage({super.key,  required this.idOffre});

  Future<Offre> fetchData(String token) async {
    final response = await http.get(
      Uri.parse(apiOffres + idOffre),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      //permettre au donnée d'accepter les caractère spéciaux
      final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
      return Offre.fromJson(jsonData);
    }else{
      throw Exception('Erreur de récupération des données depuis l\'API');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: CustomAppBar2("Detail de l'offre", context),
      body: FutureBuilder<Offre>(
        future: fetchData(authProvider.accessToken!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return const Text('Erreur de récupération des données depuis l\'API');
          }else if(snapshot.hasData){ 
            Offre monOffre = snapshot.data!;
            return Center(
              child: ListView(
                children: [
                  // PARTIE CONCERNANT LE DOMAINE DU BTP
                  Container(
                    width: double.infinity,
                    color: white,
                    padding: margin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeTextStyle("Domaine d'activité",grey2, size: headingTextSize),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customeTextStyle(monOffre.idDomaine.nomdomaine!,black),
                        ),
                      ],
                    ),
                  ),

                  // PARTIE CONCERNANT LE TRAVAUX À EXECUTER
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 3),
                    color: white,
                    padding: margin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeTextStyle("Nom Travaux",grey2, size: headingTextSize),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customeTextStyle(monOffre.idTravaux.nomtravaux!,black),
                        ),
                      ],
                    ),
                  ),

                  // PARTIE CONCERNANT LA DESCRIPTION
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    width: double.infinity,
                    color: white,
                    padding: margin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeTextStyle("Description",grey2, size: headingTextSize),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customeTextStyle(monOffre.description, black),
                        ),
                      ],
                    ),
                  ),

                  // PARTIE CONCERNANT LA DATE
                  Container(
                    width: double.infinity,
                    color: white,
                    padding: margin,
                    margin: const EdgeInsets.only(top: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeTextStyle("Date",grey2, size: headingTextSize),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customeTextStyle(formatDateString(monOffre.jour.toString()),black),
                        ),
                      ],
                    ),
                  ),

                  // PARTIE CONCERNANT L'HEURE
                  Container(
                    width: double.infinity,
                    color: white,
                    padding: margin,
                    margin: const EdgeInsets.only(top: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeTextStyle("Heure",grey2, size: headingTextSize),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customeTextStyle(monOffre.heure.toString(),black),
                        ),
                      ],
                    ),
                  ),

                  // PARTIE CONCERNANT L'ADRESSE
                  Container(
                    width: double.infinity,
                    color: white,
                    padding: margin,
                    margin: const EdgeInsets.only(top: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeTextStyle("Adresse", grey2, size: headingTextSize),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customeTextStyle(monOffre.lieu,black),
                        ),
                      ],
                    ),
                  ),

                  // PARTIE CONCERNANT LE NUMERO DE TÉLÉPHONE
                  Container(
                    width: double.infinity,
                    color: white,
                    padding: margin,
                    margin: const EdgeInsets.only(top: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customeTextStyle("Numéro de téléphone",grey2, size: headingTextSize),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: customeTextStyle(monOffre.employeur.phoneNumber ?? '',black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }else{
            return Center(child: customeTextStyle("'Aucune donnée disponible'", black),);
          }
        }
      )
    );
  }
}