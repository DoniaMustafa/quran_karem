import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_karem/bisness_logic/all_audio_cubit/all_audio_state.dart';
import 'package:quran_karem/constants/const.dart';
import 'package:quran_karem/data/model/audio_progress_bar_model.dart';
import 'package:quran_karem/data/model/surah_audio_details_model.dart';
import 'package:quran_karem/data/model/surah_audio_model.dart';
import 'package:quran_karem/data/repositories/repostory_imp.dart';

class AudioSurahCubit extends Cubit<AllAudioState> {
  Repository _repository;
  AudioSurahCubit(this._repository) : super(AllAudioInitial());



  List<SurahAudioModel>? surahAudioModel;

  Future<Repository?> getAllAudio() async {
    emit(AllAudioLoadingState());
    return await _repository.getAudioSurah().then((value) {
      surahAudioModel = surahAudioModelFromJson(value.toString());
      print(surahAudioModel);
      emit(AllAudioSuccessState(surahAudioModel: surahAudioModel!));
    }).catchError((error) {
      print(error.toString());
      showToast(
          text: error.toString(),
          gravity: ToastGravity.CENTER,
          tColor: ToastColors.ERROR
      );

      emit(AllAudioErrorState(error: error.toString()));
    });
  }



}
