import 'dart:convert';

class Etablissement{

  final String? userId;
  final String? id;
  final String type;
  final String lieu;
  final String heureOuverture;
  final String heureFermeture;
  final int capaciteMax;
  final int capaciteMin;
  final String nameEtb;
  final List<String> images;
  final String prix;
  final String description;

  Etablissement({
    this.userId,
    this.id, 
    required this.type, 
    required this.lieu, 
    required this.heureOuverture,
    required this.heureFermeture,
    required this.capaciteMax,
    required this.capaciteMin,
    required this.nameEtb,
    required this.images,
    required this.prix,
    required this.description
  });

  Map<String, dynamic> toMap() {
      
      return {
        'userId': userId,
        '_id': id,
        'heureOuverture': heureOuverture,
        'type': type,
        'lieu': lieu,
        'heureFermeture': heureFermeture,
        'capaciteMax': capaciteMax,
        'capaciteMin': capaciteMin,
        'nameEtb': nameEtb,
        'images': images,
        'prix': prix,
        'description': description
      };
    }
  factory Etablissement.fromMap(Map<String, dynamic> map){
    return Etablissement(
      userId: map['userId'] ?? '',
      id: map['_id'] ?? '', 
      type: map['type'] ?? '', 
      lieu: map['lieu'] ?? '', 
      heureOuverture: map['heureOuverture'] ?? '',
      heureFermeture: map['heureFermeture'] ?? '',
      capaciteMax: map['capaciteMax'] ?? '',
      capaciteMin: map['capaciteMin'] ?? '',
      nameEtb: map['nomEtablissement'] ?? '',
      images: List<String>.from(map['images']),
      prix: map['prix'] ?? '',
      description: map['description'] ?? ''
    );
  }

  String toJson() => json.encode(toMap());
  factory Etablissement.fromJson(String source) => Etablissement.fromMap(json.decode(source));

}