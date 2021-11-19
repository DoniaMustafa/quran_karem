
import 'dart:convert';

DetailsOfJuzModel detailsOfJuzModelFromJson(String str) => DetailsOfJuzModel.fromJson(json.decode(str));

String detailsOfJuzModelToJson(DetailsOfJuzModel data) => json.encode(data.toJson());

class DetailsOfJuzModel {
  DetailsOfJuzModel({
    this.code,
    this.status,
    this.data,
  });

  int? code;
  String? status;
  JzuData? data;

  factory DetailsOfJuzModel.fromJson(Map<String, dynamic> json) => DetailsOfJuzModel(
    code: json["code"],
    status: json["status"],
    data: JzuData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "status": status,
    "data": data!.toJson(),
  };
}

class JzuData {
  JzuData({
    this.number,
    this.ayahs,
  });

  int? number;
  List<Ayah>? ayahs;
  factory JzuData.fromJson(Map<String, dynamic> json) => JzuData(
    number: json["number"],
    ayahs: List<Ayah>.from(json["ayahs"].map((x) => Ayah.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "ayahs": List<dynamic>.from(ayahs!.map((x) => x.toJson())),
  };
}

class Ayah {
  Ayah({
    this.number,
    this.text,
    this.surah,
    this.sajda,

  });

  int? number;
  String? text;
  Surah? surah;
  bool? sajda;
  factory Ayah.fromJson(Map<String, dynamic> json) => Ayah(
    number: json["numberInSurah"],

      surah: Surah.fromJson(json["surah"]),
    text: json["text"],
    sajda: json["sajda"]
  );

  Map<String, dynamic> toJson() => {
    "numberInSurah": number,

    "text": text,
    "surah": surah!.toJson(),
    "sajda":sajda
  };
}

class Surah{
  int? num;
  String? name;

  int? numberOfAyahs;
  Surah({this.num,this.numberOfAyahs, this.name});
  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
    num: json["number"],
      name: json["name"],

      numberOfAyahs:json["numberOfAyahs"]
  );
  Map<String, dynamic> toJson() =>
      {
        "name": name,

        "number": num,
        "numberOfAyahs":numberOfAyahs
      };
}