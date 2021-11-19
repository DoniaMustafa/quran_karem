part of 'audio_details_cubit.dart';

@immutable
abstract class AudioDetailsState {}

class AudioDetailsInitial extends AudioDetailsState {}
class ClickItemState extends AudioDetailsState {}
class AudioDetailsLoadingState extends AudioDetailsState {}

class AudioDetailsSuccessState extends AudioDetailsState {
  final SurahAudioDetailsModel audioDetailsModel;

  AudioDetailsSuccessState({required this.audioDetailsModel});
}

class AudioDetailsErrorState extends AudioDetailsState {
  final String error;

  AudioDetailsErrorState({required this.error});
}


class PlayAudioSuccessState extends AudioDetailsState {
}
class PlayAudioErrorState extends AudioDetailsState {}

class PlaySuccessState extends AudioDetailsState {}
class PauseSuccessState extends AudioDetailsState {}
class DisposeSuccessState extends AudioDetailsState {}
class SeekSuccessState extends AudioDetailsState {}

