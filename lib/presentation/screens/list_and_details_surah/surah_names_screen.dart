import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/bisness_logic/names_sur_cubit/surah_name_cubit.dart';
import 'package:quran_karem/bisness_logic/names_sur_cubit/surah_name_state.dart';
import 'package:quran_karem/constants/colors.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/constants/styel.dart';
import 'package:quran_karem/data/model/surah_name_model.dart';
import 'package:quran_karem/presentation/screens/home_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_surah/details_sur_screen.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/widget/circle.dart';
import 'package:quran_karem/presentation/widget/frame_widget.dart';
import 'package:quran_karem/presentation/widget/header_text_and_img_widget.dart';
import 'package:quran_karem/presentation/widget/loading_scrren_widget.dart';

class SurahNamesScreen extends StatelessWidget {


 _buildListNamesOfSurah({required Data data}) => Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            circle(data: data.number.toString()),
            SizedBox(
              width: 10.0,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: data.name,
                style: white20bold(),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            _buildSpaceLastOfItem(data)
          ],
        ),
      );
_buildSpaceLastOfItem(Data data)=>Column(
  children: [
  Row(
  children: [
  RichText(
  text: TextSpan(
  style: white18regular(), text: 'عدد الايات : '),
  ),
  RichText(
  text: TextSpan(
  style: white18regular(),
  text: data.numberOfAyahs.toString()),
  ),
  ],
  ),
  RichText(
  text: TextSpan(
  text: data.revelationType == "Medinan" ? "مدينة" : "مكة",
  style: white18regular()),
  ),
  ],
  );

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) =>
        nameSurahRep..getAllSurahNames(),
        child: Scaffold(
          body: SafeArea(
            child: customFrame(
              child: Column(
                children: [
                  HeaderImageAndTextWidget(title: 'السُّوَر  القرآنية',isShow: true,
                    onPress: (){
                    print('ok');
                      navigaTo(context: context,widget:HomeScreen());
                    },
                  ),
                  BlocBuilder<SurahNamesCubit, SurahNameState>(
                    builder: (context, state) {
                      if (state is NamesOfSurahSuccessState &&
                          state.names != null) {
                        return Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, int index) => InkWell(
                                    onTap: () {
                                      print(state.names.data![index].number!);
                                      navigaTo(
                                          context: context,widget:
                                      DetailsOfSurahScreen(
                                              title: state
                                                  .names.data![index].name
                                                  .toString(),
                                              id: state
                                                  .names.data![index].number!));
                                    },
                                    child: _buildListNamesOfSurah(
                                      data: state.names.data![index],
                                    ),
                                  ),
                              separatorBuilder: (context, int index) => Divider(
                                    color: divColor,
                                  ),
                              itemCount: state.names.data!.length),
                        );
                      } else {
                        return AnimationLoadingWidget();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
