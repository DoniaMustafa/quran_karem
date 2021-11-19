// To parse this JSON data, do
//
//     final surahNameModel = surahNameModelFromJson(jsonString);

import 'dart:convert';

NamesOfSurahModel surahNameModelFromJson(String str) => NamesOfSurahModel.fromJson(json.decode(str));

String surahNameModelToJson(NamesOfSurahModel data) => json.encode(data.toJson());

class NamesOfSurahModel {
  NamesOfSurahModel({
    this.data,
  });

  List<Data>? data;

  factory NamesOfSurahModel.fromJson(Map<String, dynamic> json) => NamesOfSurahModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    this.number,
    this.name,
    this.numberOfAyahs,
    this.revelationType,
  });

 final int? number;
 final String? name;
 final int? numberOfAyahs;
 final String? revelationType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    number: json["number"],
    name: json["name"],
    numberOfAyahs: json["numberOfAyahs"],
    revelationType: json["revelationType"],
  );

  Map<String, dynamic> toJson() => {
    "number": number,
    "name": name,
    "numberOfAyahs": numberOfAyahs,
    "revelationType":revelationType,
  };
}

