import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/bisness_logic/all_audio_cubit/all_audio_cubit.dart';
import 'package:quran_karem/bisness_logic/all_audio_cubit/all_audio_state.dart';
import 'package:quran_karem/bisness_logic/audio_detail_cubit/audio_details_cubit.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/constants/const.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/data/model/audio_progress_bar_model.dart';
import 'package:quran_karem/presentation/widget/frame_widget.dart';
import 'package:quran_karem/presentation/widget/header_text_and_img_widget.dart';
import 'package:quran_karem/presentation/widget/item_widget.dart';
import 'package:quran_karem/presentation/widget/loading_scrren_widget.dart';

class ReaderScreen extends StatefulWidget {
   int id;
  ReaderScreen({required this.id,this.ul});
 String? ul;

  @override
  _ReaderScreenState createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  int i =1;
 intw(){
   if(i>3)
setState(() {
 i++;
});
}

  @override
  void dispose() {
    audioDetailsRep.player!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SafeArea(
        child: customFrame(
          child:  BlocProvider(
            create: (context) => audioDetailsRep
              ..getAudioDetails(widget.id),
  child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderImageAndTextWidget(
                isShow: true,
                title: 'التلاوات القرآنية',
              ),
              BlocBuilder<AudioSurahCubit, AllAudioState>(
                builder: (context, state) {
                  if (audioDetailsRep.audioDetailsModel != null) {
                    return Column(
                      children: List.generate(
                          audioDetailsRep.audioDetailsModel!.recitations!.length,
                              (index) => Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            child:InkWell(
                              onTap: () {
                                audioDetailsRep.initState( audioDetailsRep.audioDetailsModel!.recitations![index].audioUrl!);
                                if(state is PlayAudioSuccessState&& state is AudioDetailsSuccessState){
                                  audioDetailsRep.play();
                                }
                                print(widget.ul);

                              },
                              child: ItemOfListWidget(
                                numberTxt: (index + 1).toString(),
                                txt:  audioDetailsRep.audioDetailsModel!
                                    .recitations!
                                    .elementAt(index) !=
                                    audioDetailsRep.audioDetailsModel!
                                        .recitations![0]
                                    ? ( audioDetailsRep.audioDetailsModel!
                                    .recitations!
                                    .elementAt(index) ==
                                    audioDetailsRep.audioDetailsModel!
                                        .recitations![1]
                                    ? recitationName[1]
                                    .readersName
                                    : recitationName[2]
                                    .readersName)
                                    : recitationName[0].readersName,
                              ),
                            ),
                          )),
                    );
                  } else{
                    return AnimationLoadingWidget();
                  }
                },
              ),
              Spacer(flex: 1,),
              BlocBuilder<AudioSurahCubit, AllAudioState>(
                builder: (context, state) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 20.0),
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: _buildAudio(context),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        color: transparentBlack,

                        borderRadius: BorderRadius.circular(10.0)),
                  );
                },
              ),

            ],
          ),
),
        ),
      )),
    );
  }

  _buildAudio(context) => Column(
    children: [
      ValueListenableBuilder<ProgressBarState>(
        valueListenable: audioDetailsRep.progressNotifier,
        builder: (_, value, __) {
          return ProgressBar(bufferedBarColor: Colors.white,

            timeLabelTextStyle: white14regular(),
            thumbColor:  Colors.white,
            progress: value.current,
            buffered: value.buffered,
            total: value.total,
            onSeek: audioDetailsRep.seek,
          );
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
              onTap: (){
                audioDetailsRep.getAudioDetails(widget.id++);
                print(widget.id++);
              },
              child: Icon(Icons.skip_next)),
          ValueListenableBuilder<ButtonState>(
            valueListenable: audioDetailsRep.buttonNotifier,
            builder: (_, value, __) {
              switch (value) {
                case ButtonState.loading:
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 32.0,
                    height: 32.0,
                    child: CircularProgressIndicator(),
                  );
                case ButtonState.paused:
                  return IconButton(
                    icon: Icon(
                      Icons.play_arrow,
                      color:white,
                    ),
                    iconSize: 32.0,
                    onPressed: () =>audioDetailsRep.play(),
                  );
                case ButtonState.playing:
                  return IconButton(
                    icon: Icon(
                      Icons.pause,
                      color: white,
                    ),
                    iconSize: 32.0,
                    onPressed: () =>audioDetailsRep.pause(),
                  );
              }
            },
          ),
          GestureDetector(
              onTap: (){
                audioDetailsRep.getAudioDetails(widget.id--);
                print(widget.id--);
              },
              child: Icon(Icons.skip_previous)),

        ],
      ),



    ],
  );
}
