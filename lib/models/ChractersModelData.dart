// To parse this JSON data, do
//
//     final charactersModelData = charactersModelDataFromJson(jsonString);

import 'dart:convert';

List<HPChractersModel> hpChractersModelFromJSON(String str) =>
    List<HPChractersModel>.from(
        json.decode(str).map((x) => HPChractersModel.fromJson(x)));

String hpChractersModelToJSON(List<HPChractersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

HPChractersModel hpChracterModelFromJSON(String str) =>
    HPChractersModel.fromJson(json.decode(str));

String hpChracterModelToJSON(HPChractersModel data) =>
    json.encode(data.toJson());

class HPChractersModel {
  HPChractersModel({
    this.name = '',
    this.alternateNames,
    this.species = '',
    this.gender = '',
    this.house = '',
    this.dateOfBirth = '',
    this.yearOfBirth,
    this.wizard = false,
    this.ancestry = '',
    this.eyeColour = '',
    this.hairColour = '',
    this.wand,
    this.patronus = '',
    this.hogwartsStudent = false,
    this.hogwartsStaff = false,
    this.actor = '',
    this.alternateActors,
    this.alive = false,
    this.image = '',
  });

  String name;
  List<dynamic>? alternateNames;
  String species;
  String gender;
  String house;
  String dateOfBirth;
  num? yearOfBirth;
  bool wizard;
  String ancestry;
  String eyeColour;
  String hairColour;
  Wand? wand;
  String patronus;
  bool hogwartsStudent;
  bool hogwartsStaff;
  String actor;
  List<dynamic>? alternateActors;
  bool alive;
  String image;

  factory HPChractersModel.fromJson(Map<String, dynamic> json) =>
      HPChractersModel(
        name: json["name"],
        alternateNames:
            List<dynamic>.from(json["alternate_names"].map((x) => x)),
        species: json["species"],
        gender: json["gender"],
        house: json["house"],
        dateOfBirth: json["dateOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        wizard: json["wizard"],
        ancestry: json["ancestry"],
        eyeColour: json["eyeColour"],
        hairColour: json["hairColour"],
        wand: Wand.fromJson(json["wand"]),
        patronus: json["patronus"],
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alternateActors:
            List<dynamic>.from(json["alternate_actors"].map((x) => x)),
        alive: json["alive"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "alternate_names": List<dynamic>.from(alternateNames!.map((x) => x)),
        "species": species,
        "gender": gender,
        "house": house,
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "wizard": wizard,
        "ancestry": ancestry,
        "eyeColour": eyeColour,
        "hairColour": hairColour,
        "wand": wand?.toJson(),
        "patronus": patronus,
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alternate_actors": List<dynamic>.from(alternateActors!.map((x) => x)),
        "alive": alive,
        "image": image,
      };
}

class Wand {
  Wand({
    this.wood = '',
    this.core = '',
    this.length,
  });

  String wood;
  String core;
  num? length;

  factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: json["wood"],
        core: json["core"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "wood": wood,
        "core": core,
        "length": length,
      };
}
