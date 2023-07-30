import 'package:flutter/material.dart';
import 'package:oppuss/models/account.dart';
import 'package:oppuss/models/gestion_qualification.dart';

class Commentaire {
  final int id;
  final Staff worker;
  final int idOffre;
  final String content;
  final DateTime date;
  final DateTime createdAt;
  final DateTime updatedAt;

  Commentaire({
    required this.id,
    required this.worker,
    required this.idOffre,
    required this.content,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Commentaire.fromJson(Map<String, dynamic> json) {
    return Commentaire(
      id: json['id'],
      worker: Staff.fromJson(json['worker']),
      idOffre: json['id_offre'],
      content: json['content'],
      date: DateTime.parse(json['date']),
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class Offre {
  final int id;
  final int idDomaine;
  final int idTravaux;
  final Employeur employeur;
  final List<Commentaire> commentaires;
  final DateTime jour;
  final TimeOfDay heure;
  final String description;
  final String lieu;
  final bool statut;
  final DateTime createdAt;
  final DateTime updatedAt;

  Offre({
    required this.id,
    required this.idDomaine,
    required this.idTravaux,
    required this.employeur,
    required this.commentaires,
    required this.jour,
    required this.heure,
    required this.description,
    required this.lieu,
    required this.statut,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Offre.fromJson(Map<String, dynamic> json) {
    var commentaireList = <Commentaire>[];
    if (json['commentaires'] != null) {
      for (var commentaireJson in json['commentaires']) {
        commentaireList.add(Commentaire.fromJson(commentaireJson));
      }
    }

    // Conversion de la date
    var jour = DateTime.parse(json['jour']);

    // Conversion de l'heure
    var heureParts = json['heure'].split(':');
    var heure = TimeOfDay(
      hour: int.parse(heureParts[0]),
      minute: int.parse(heureParts[1]),
    );
    return Offre(
      id: json['id'],
      idDomaine: json['id_domaine'],
      idTravaux: json['id_travaux'],
      employeur: Employeur.fromJson(json['employeur']),
      commentaires: commentaireList,
      jour: jour,
      heure: heure,
      description: json['description'],
      lieu: json['lieu'],
      statut: json['statut'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  factory Offre.defaultValues() {
    return Offre(
      id: 0,
      idDomaine: 1,
      idTravaux: 2,
      employeur: Employeur(id: 0, email: '', username: '', password: '', isActive: false, isAdmin: false, createdAt: DateTime.now(), updatedAt: DateTime.now()),
      commentaires: [],
      jour: DateTime.now(),
      heure: TimeOfDay.now(),
      description: '',
      lieu: '',
      statut: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
  }
}
