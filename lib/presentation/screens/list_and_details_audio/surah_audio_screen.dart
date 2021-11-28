import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/bisness_logic/all_audio_cubit/all_audio_cubit.dart';
import 'package:quran_karem/bisness_logic/all_audio_cubit/all_audio_state.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/screens/home_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_audio/readers_screen.dart';
import 'package:quran_karem/presentation/widget/frame_widget.dart';
import 'package:quran_karem/presentation/widget/header_text_and_img_widget.dart';
import 'package:quran_karem/presentation/widget/item_widget.dart';
import 'package:quran_karem/presentation/widget/loading_scrren_widget.dart';

class SurahAudioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          body: SafeArea(
        child:customFrame(
          child: BlocProvider(
            create: (context) => audioSurahRep..getAllAudio(),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HeaderImageAndTextWidget(
                title: 'التلاوآت القرأنية',isShow: true,
                onPress: ()=>navigaTo(context: context,widget: HomeScreen()),
              ),
              Expanded(
                  child: BlocBuilder<AudioSurahCubit, AllAudioState>(
                    builder: (context, state) {
                      if (state is AllAudioSuccessState &&
                          state.surahAudioModel != null) {
                        return ListView.separated(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, int index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: InkWell(
                                    onTap: () {
                                      // print('reader: $id');
                                      navigaTo(
                                          context: context,widget:
                                      ReaderScreen(state.surahAudioModel![index].numberOfSurah!,));
                                    },
                                    child: ItemOfListWidget(
                                      numberTxt: state.surahAudioModel![index]
                                          .numberOfSurah
                                          .toString(),
                                      txt: state.surahAudioModel![index]
                                          .nameTranslations!.ar
                                          .toString(),
                                    ),
                                  ),
                                ),
                            separatorBuilder: (context, int index) => Divider(indent: 20,endIndent: 20,),
                            itemCount: state.surahAudioModel!.length);
                      } else {
                        return AnimationLoadingWidget();
                      }
                    },
                  ))
            ],
          ),
),
        ),
      )),
    );
  }


}
