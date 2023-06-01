class Travaux {
    int? id;
    String? nomtravaux;
    int? iddomaine;

    Travaux({this.id, this.nomtravaux, this.iddomaine}); 

    Travaux.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        nomtravaux = json['nom_travaux'];
        iddomaine = json['id_domaine'];
    }
}

class Domaine {
    int? id;
    String? nomdomaine;
    String? image;
    List<Travaux?>? travauxset;

    Domaine({this.id, this.nomdomaine, this.image, this.travauxset}); 

    Domaine.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        nomdomaine = json['nom_domaine'];
        image = json['image'];
        if (json['travaux_set'] != null) {
         travauxset = <Travaux>[];
         json['travaux_set'].forEach((v) {
         travauxset!.add(Travaux.fromJson(v));
        });
      }
    }
}


