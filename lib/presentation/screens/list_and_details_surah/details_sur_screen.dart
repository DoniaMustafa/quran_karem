import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/bisness_logic/detaild_sur_cubit/details_of_surah_state.dart';
import 'package:quran_karem/bisness_logic/detaild_sur_cubit/details_of_surah_cubit.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/widget/frame_widget.dart';
import 'package:quran_karem/presentation/widget/header_text_and_img_widget.dart';
import 'package:quran_karem/presentation/widget/loading_scrren_widget.dart';

class DetailsOfSurahScreen extends StatelessWidget {
  final int id;
  final String title;
  DetailsOfSurahScreen({required this.id, required this.title});
  // Widget buildSurahContent(state) =>

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocProvider(
            create: (context) =>
            detailsOfSurahRep..getDetailsOfSurah(id: id),
            child: SafeArea(
              child: customFrame(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeaderImageAndTextWidget(title: title,
                    isShow: false,
                    onPress:()=> navigatorPop(context:context),),
                    Expanded(child: _buildSurahDetails()),

                  ],
                ),
              ),
            )
            // :buildLoadingCircle()
            ),
      ),
    );
  }
  _buildSurahDetails()=> BlocBuilder<DetailsOfSurahCubit, DetailsOfSurahState>(
      builder: (context, state) {
        if (state is DetailsOfSurahSuccessState &&
            state.detailsOfSurahModel != null) {
          return Padding(
            padding: EdgeInsets.only(right: 35.0, left: 40),
            child: AspectRatio(
              aspectRatio: 1.0/1.8,
              child: SingleChildScrollView(
                  child:RichText(
                    text: TextSpan(
                        children:
                        state.detailsOfSurahModel!.data!.ayahs!.map(
                              (e) => TextSpan(
                              style: white20regular() ,
                              text:
                              '${e.text} ${e.sajda == true ? '۩' : ''} ﴿${e.numberInSurah}﴾'),
                        )
                            .toList()),
                  )
              ),
            ),
          );
        } else {
          return Container(
            alignment: Alignment.center,
              child: AnimationLoadingWidget());
        }
      });

}
