import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_karem/constants/const.dart';
import 'package:quran_karem/data/model/audio_progress_bar_model.dart';
import 'package:quran_karem/data/model/surah_audio_details_model.dart';
import 'package:quran_karem/data/repositories/repostory_imp.dart';
part 'audio_details_state.dart';

class AudioDetailsCubit extends Cubit<AudioDetailsState> {
  Repository _repository;
  AudioDetailsCubit(this._repository) : super(AudioDetailsInitial());
  AudioPlayer? player;
  String? select;



  SurahAudioDetailsModel? audioDetailsModel;
  List<Recitation>? recitations;
  Future<Response?>getAudioDetails(int reader)async{
    emit(AudioDetailsLoadingState());
    return await _repository.getAudioSurahDetails(id:reader).then((value) {
      audioDetailsModel =surahAudioDetailsModelFromJson(value.toString());
      print(audioDetailsModel);
      emit(AudioDetailsSuccessState(audioDetailsModel:audioDetailsModel!));
    }).catchError((onError){
      print(onError.toString());
      showToast(
          text: onError.toString(),
          gravity: ToastGravity.CENTER,
          tColor: ToastColors.ERROR
      );

      emit(AudioDetailsErrorState(
          error:onError.toString()
      ));
    }); }

  Duration? duration;
  void initState(String reader)async {
    player = AudioPlayer();
    await player!.setUrl(reader);
    plaYStream();
    positian();
    seeke();
    emit(PlayAudioSuccessState());
  }

  onClickItem( val){
    select = val;
    print(select.toString());
    print(val);
    emit(ClickItemState());
  }


  Future<void> dispose() async{
    await player!.dispose();
    emit(DisposeSuccessState());
  }




  final progressNotifier = ValueNotifier<ProgressBarState>(
    ProgressBarState(

      current: Duration.zero,
      buffered: Duration.zero,
      total: Duration.zero,
    ),
  );
  final buttonNotifier = ValueNotifier<ButtonState>(ButtonState.paused);

  bool? isPlay =false;
  void play() {
    player!.play();
    isPlay = true;
    print(  player!.play().toString());

    emit(PlaySuccessState());
  }

  void pause() {
    player!.pause();
    isPlay =false;
    print(  player!.pause());
    emit(PauseSuccessState());
  }

  void seek(Duration position) {
    player!.seek(position);
    emit(SeekSuccessState());
  }


  bool? isPlaying;

  plaYStream() {

    player!.playerStateStream.listen((playerState) {
      isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying!) {
        buttonNotifier.value = ButtonState.paused;
      } else {
        buttonNotifier.value = ButtonState.playing;
      }
    });
  }


  positian(){
    player!.positionStream.listen((position) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });
    player!.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });
    player!.durationStream.listen((totalDuration) {
      final oldState = progressNotifier.value;
      progressNotifier.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }

  seeke(){
    player!.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonNotifier.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonNotifier.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonNotifier.value = ButtonState.playing;
      } else { // completed
        player!.seek(Duration.zero);
        player!.pause();
      }
    });
  }








}
