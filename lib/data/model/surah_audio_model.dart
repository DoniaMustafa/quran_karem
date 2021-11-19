import 'dart:convert';

List<SurahAudioModel> surahAudioModelFromJson(String str) => List<SurahAudioModel>.from(json.decode(str).map((x) => SurahAudioModel.fromJson(x)));

String surahAudioModelToJson(List<SurahAudioModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SurahAudioModel {
  SurahAudioModel({
    this.nameTranslations,
    this.numberOfSurah,
  });


  NameTranslations? nameTranslations;
  int? numberOfSurah;

  factory SurahAudioModel.fromJson(Map<String, dynamic> json) => SurahAudioModel(
    nameTranslations: NameTranslations.fromJson(json["name_translations"]),
    numberOfSurah: json["number_of_surah"],

  );

  Map<String, dynamic> toJson() => {
    "name_translations": nameTranslations!.toJson(),
    "number_of_surah": numberOfSurah,
  };
}

class NameTranslations {
  NameTranslations({
    this.ar,
    this.id,
  });

  String? ar;
  String? id;

  factory NameTranslations.fromJson(Map<String, dynamic> json) => NameTranslations(
    ar: json["ar"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "ar": ar,
    "id": id,
  };
}



