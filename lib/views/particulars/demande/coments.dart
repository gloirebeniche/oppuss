import 'package:flutter/material.dart';
import 'package:oppuss/api/api.dart';
import 'package:oppuss/api/auth_provider.dart';
import 'package:oppuss/models/gestion_offres.dart';
import 'package:oppuss/utils/theme.dart';
import 'package:oppuss/views/fullsreen.dart';
import 'package:oppuss/widget/customized_appbar.dart';
import 'package:oppuss/widget/particular/app_widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class ComentView extends StatelessWidget {
  final dynamic idOffre;
  const ComentView({super.key, required this.idOffre});

  Future<Offre> fetchData(String token) async {
    final response = await http.get(
      Uri.parse(apiOffres + idOffre.toString()),
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
      appBar: CustomAppBar2("Questions et réponses", context),
      backgroundColor: grey1,
      body: FutureBuilder<Offre>(
        future: fetchData(authProvider.accessToken!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return const Text('Erreur de récupération des données depuis l\'API');
          }else if(snapshot.hasData){ 
            Offre monOffre = snapshot.data!;
            return ListView.builder(
              itemCount: monOffre.commentaires.length,
              itemBuilder: (context, index) {
                return cardComent("${monOffre.commentaires[index].worker.prenom} ${monOffre.commentaires[index].worker.nom}", monOffre.commentaires[index].content, monOffre.commentaires[index].createdAt);
              },
            );
          }else{
            return Center(child: customeTextStyle("'Aucune donnée disponible'", black),);
          }
        }
      )
    );
  }
}