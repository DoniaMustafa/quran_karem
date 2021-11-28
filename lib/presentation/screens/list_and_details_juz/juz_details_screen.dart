import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/bisness_logic/juz_ama_cubit/juz_cubit.dart';
import 'package:quran_karem/bisness_logic/juz_ama_cubit/juz_state.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/widget/frame_widget.dart';
import 'package:quran_karem/presentation/widget/header_text_and_img_widget.dart';
import 'package:quran_karem/presentation/widget/loading_scrren_widget.dart';

class JuzDetailScreen extends StatelessWidget {
  final int id;
  final String juzNumber;

  JuzDetailScreen({required this.id, required this.juzNumber});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: BlocProvider(
            create: (_) => juzCubitRep
              ..getAllJuz(id: id),
            child: SafeArea(
              child: customFrame(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HeaderImageAndTextWidget(title: juzNumber,isShow: true, onPress: navigatorPop(context:context),
            ),
                    Expanded(child:_customSurah(),)
                  ],
                )
              ),
            ),
          ),
        ));
  }

  _customSurah()=>BlocBuilder<JuzCubit, JuzState>(
    builder: (_, state) {
      if (state is JuzSuccessState) {
        return Padding(
          padding: EdgeInsets.only(right: 35.0, left: 40,),
          child: AspectRatio(
            aspectRatio: 1.0 / 1.9,
            child: SingleChildScrollView(
              child: _buildSurahContent(_),
            ),
          ),
        );
      } else {
        return AnimationLoadingWidget();
      }
    },
  );

  _buildSurahContent(context) => RichText(
    text: TextSpan(
        children: juzCubitRep
            .detailsOfJuz!
            .data!
            .ayahs!
            .map(
              (e) => TextSpan(
            children: [
              TextSpan(
                text: '${e.text!} ${e.sajda == true ? '۩' : ''}',
              ),
              TextSpan(
                  text:
                  '${e.surah!.num!.compareTo(e.surah!.num!.toInt()) == false ? '${e.number}' '\n' : '﴿${e.number}﴾'}')
            ],
            style: white20regular(),
          ),
        )
            .toList()),
  );
}
