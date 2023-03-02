import 'dart:convert';

class Domaine {
  final int id;
  final String nom_domaine;
  final String travaux_set;


  Domaine({required this.id, required this.nom_domaine, required this.travaux_set});

  factory Domaine.fromJson(Map<String, dynamic> json) {
    return Domaine(
      id: json['id'],
      nom_domaine: json['nom_domaine'],
      travaux_set: json['travaux_set']
    );
  }
}


class Travaux {
  final int id;
  final String nom_travaux;

  Travaux({required this.id, required this.nom_travaux});

  factory Travaux.fromJson(Map<String, dynamic> json) {
    return Travaux(
      id: json['id'],
      nom_travaux: json['nom_travaux'],
    );
  }
}

class Metier {
  final int id;
  final String nom_metier;

  Metier({required this.id, required this.nom_metier});

  factory Metier.fromJson(Map<String, dynamic> json) {
    return Metier(
      id: json['id'],
      nom_metier: json['nom_metier'],
    );
  }
}
