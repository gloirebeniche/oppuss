class Metier {
  int id;
  String nomMetier;

  Metier({
    required this.id,
    required this.nomMetier,
  });

  factory Metier.fromJson(Map<String, dynamic> json) {
    return Metier(
      id: json['id'],
      nomMetier: json['nom_metier'],
    );
  }
}

class Experience {
  int id;
  String poste;
  String nomEntreprise;
  String lieu;
  DateTime dateDebut;
  DateTime dateFin;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  int worker;

  Experience({
    required this.id,
    required this.poste,
    required this.nomEntreprise,
    required this.lieu,
    required this.dateDebut,
    required this.dateFin,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.worker,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      id: json['id'],
      poste: json['poste'],
      nomEntreprise: json['nom_entreprise'],
      lieu: json['lieu'],
      dateDebut: DateTime.parse(json['date_debut']),
      dateFin: DateTime.parse(json['date_fin']),
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      worker: json['worker'],
    );
  }
}

class Formation {
  int id;
  DateTime dateDebut;
  DateTime dateFin;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  int idEtablissement;
  int idDiplome;
  int idDomaineEtude;
  int worker;

  Formation({
    required this.id,
    required this.dateDebut,
    required this.dateFin,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.idEtablissement,
    required this.idDiplome,
    required this.idDomaineEtude,
    required this.worker,
  });

  factory Formation.fromJson(Map<String, dynamic> json) {
    return Formation(
      id: json['id'],
      dateDebut: DateTime.parse(json['date_debut']),
      dateFin: DateTime.parse(json['date_fin']),
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      idEtablissement: json['id_etablissement'],
      idDiplome: json['id_diplome'],
      idDomaineEtude: json['id_domaine_etude'],
      worker: json['worker'],
    );
  }
}

class Competence {
  int id;
  String competence;
  DateTime createdAt;
  DateTime updatedAt;
  List<int> workers;

  Competence({
    required this.id,
    required this.competence,
    required this.createdAt,
    required this.updatedAt,
    required this.workers,
  });

  factory Competence.fromJson(Map<String, dynamic> json) {
    return Competence(
      id: json['id'],
      competence: json['competence'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      workers: List<int>.from(json['workers']),
    );
  }
}

class Worker {
  int id;
  Metier metier;
  List<Experience> experiences;
  List<Formation> formations;
  List<Competence> competences;
  String password;
  DateTime? lastLogin;
  String username;
  String prenom;
  String nom;
  String email;
  String civilite;
  String tel;
  String? adress;
  DateTime? dateNaiss;
  String? ville;
  bool isActive;
  bool isAdmin;
  DateTime createdAt;
  DateTime updatedAt;
  int nombreJobs;
  int nombreDavis;
  int anneeExperience;

  Worker({
    required this.id,
    required this.metier,
    required this.experiences,
    required this.formations,
    required this.competences,
    required this.password,
    this.lastLogin,
    required this.username,
    required this.prenom,
    required this.nom,
    required this.email,
    required this.civilite,
    required this.tel,
    this.adress,
    this.dateNaiss,
    this.ville,
    required this.isActive,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.nombreJobs,
    required this.nombreDavis,
    required this.anneeExperience,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['id'],
      metier: Metier.fromJson(json['metier']),
      experiences: List<Experience>.from(json['experiences'].map((x) => Experience.fromJson(x))),
      formations: List<Formation>.from(json['formations'].map((x) => Formation.fromJson(x))),
      competences: List<Competence>.from(json['competences'].map((x) => Competence.fromJson(x))),
      password: json['password'],
      lastLogin: json['last_login'] != null ? DateTime.parse(json['last_login']) : null,
      username: json['username'],
      prenom: json['prenom'] ?? "",
      nom: json['nom'] ?? "",
      email: json['email'],
      civilite: json['civilite'] ?? "",
      tel: json['tel'] ?? "",
      adress: json['adress'] ?? "",
      dateNaiss: json['date_naiss'] != null ? DateTime.parse(json['date_naiss']) : null ,
      ville: json['ville'] ?? "",
      isActive: json['is_active'] ?? "",
      isAdmin: json['is_admin'] ?? "",
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      nombreJobs: json['nombre_jobs'],
      nombreDavis: json['nombre_davis'],
      anneeExperience: json['annee_experience'],
    );
  }
}
