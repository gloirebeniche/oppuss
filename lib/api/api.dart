// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const String urlbase = "http://192.168.1.78:8000/";
// ignore: constant_identifier_names
const String api_worker_profile_view = "${urlbase}api/user/profile";
const String api_login_view = "${urlbase}api/user/login/";
const String api_user_register = "${urlbase}api/user/register-client/";
const String api_get_current_user = "${urlbase}api/user/get_current_user/";

const String api_domaine_view = "${urlbase}api/ref-btp/domaines/";
const String api_travaux_view = "${urlbase}api/ref-btp/travaux/";
const String api_metier_view = "${urlbase}api/ref-btp/metier/";


Future<void> fetchDomaines() async {

    final response = await http.get(Uri.parse(api_domaine_view));
  
    final decodedResponse = utf8.decode(response.bodyBytes);

    if (response.statusCode == 200) {
      // Si la requête a réussi, on enregistre dans les domaines dans les fichier de préference de l'app
      SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('domaines', decodedResponse);

    } else {
      // Sinon, on lance une exception avec le message d'erreur renvoyé par l'API Django
      throw Exception('Erreur lors de la récupération des domaines: ${response.reasonPhrase}');
    } 
}

Future<void> fetchTravaux() async {

  final response = await http.get(Uri.parse(api_travaux_view));
  
  final decodedResponse = utf8.decode(response.bodyBytes);

  if (response.statusCode == 200) {
    // Si la requête a réussi, on enregistre dans les domaines dans les fichier de préference de l'app
    SharedPreferences prefs = await SharedPreferences.getInstance();
  
    prefs.setString('travaux', decodedResponse);
    
  } else {
    // Sinon, on lance une exception avec le message d'erreur renvoyé par l'API Django
    throw Exception('Erreur lors de la récupération des travaux: ${response.reasonPhrase}');
  }
}

Future<void> fetchMetier() async {

  final response = await http.get(Uri.parse(api_metier_view));
  
  final decodedResponse = utf8.decode(response.bodyBytes);

  if (response.statusCode == 200) {
    // Si la requête a réussi, on enregistre dans les domaines dans les fichier de préference de l'app
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('metiers', decodedResponse);

  } else {
    // Sinon, on lance une exception avec le message d'erreur renvoyé par l'API Django
    throw Exception('Erreur lors de la récupération des metiers: ${response.reasonPhrase}');
  }
}


