import 'package:quran_karem/data/model/surah_audio_details_model.dart';
import 'package:quran_karem/data/model/surah_audio_model.dart';

abstract class AllAudioState {}

class AllAudioInitial extends AllAudioState {}

class AllAudioLoadingState extends AllAudioState {}

class AllAudioSuccessState extends AllAudioState {
  final List<SurahAudioModel>? surahAudioModel;

  AllAudioSuccessState({required this.surahAudioModel});
}

class AllAudioErrorState extends AllAudioState {
  final String error;

  AllAudioErrorState({required this.error});
}

