
import 'dart:convert';

SurahAudioDetailsModel surahAudioDetailsModelFromJson(String str) => SurahAudioDetailsModel.fromJson(json.decode(str));

String surahAudioDetailsModelToJson(SurahAudioDetailsModel data) => json.encode(data.toJson());

class SurahAudioDetailsModel {
  SurahAudioDetailsModel({
    this.nameTranslations,
    this.numberOfSurah,
    this.recitations,
  });

  NameTranslations? nameTranslations;
  int? numberOfSurah;
  List<Recitation>? recitations;

  factory SurahAudioDetailsModel.fromJson(Map<String, dynamic> json) => SurahAudioDetailsModel(
    nameTranslations: NameTranslations.fromJson(json["name_translations"]),
    numberOfSurah: json["number_of_surah"],
    recitations: List<Recitation>.from(json["recitations"].map((x) => Recitation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name_translations": nameTranslations!.toJson(),
    "number_of_surah": numberOfSurah,
    "recitations": List<dynamic>.from(recitations!.map((x) => x.toJson())),
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

class Recitation {
  Recitation({
    this.name,
    this.audioUrl,
  });

  String? name;
  String? audioUrl;

  factory Recitation.fromJson(Map<String, dynamic> json) => Recitation(
    name: json["name"],
    audioUrl: json["audio_url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "audio_url": audioUrl,
  };
}

