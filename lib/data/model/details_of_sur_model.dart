// To parse this JSON data, do
//
//     final detailsOfSurahModel = detailsOfSurahModelFromJson(jsonString);

import 'dart:convert';

DetailsOfSurahModel detailsOfSurahModelFromJson(String str) => DetailsOfSurahModel.fromJson(json.decode(str));

String detailsOfSurahModelToJson(DetailsOfSurahModel data) => json.encode(data.toJson());

class DetailsOfSurahModel {
  DetailsOfSurahModel({
    this.code,
    this.status,
    this.data,
  });

  int? code;
  String? status;
  DetailsData? data;

  factory DetailsOfSurahModel.fromJson(Map<String, dynamic> json) => DetailsOfSurahModel(
    code: json["code"],
    status: json["status"],
    data: DetailsData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data!.toJson(),
  };
}

class DetailsData {
  DetailsData({
    this.number,
    this.name,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
  });

  int? number;
  String? name;
  String? revelationType;
  int? numberOfAyahs;
  List<Ayah>? ayahs;

  factory DetailsData.fromJson(Map<String, dynamic> json) => DetailsData(
    number: json["number"],
    name: json["name"],
    revelationType: json["revelationType"],
    numberOfAyahs: json["numberOfAyahs"],
    ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "numberOfAyahs": numberOfAyahs,
    "revelationType": revelationType,
    "ayahs": List<dynamic>.from(ayahs!.map((x) => x.toJson())),
  };
}

class Ayah {
  Ayah({
    this.text,
    this.numberInSurah,
    this.sajda,
  });

  String? text;
  int? numberInSurah;
  bool? sajda;

  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
    text: json["text"],
    numberInSurah: json["numberInSurah"],
    sajda: json["sajda"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "numberInSurah": numberInSurah,
    "sajda": sajda,
  };
}

