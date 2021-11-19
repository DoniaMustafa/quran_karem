import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran_karem/bisness_logic/names_sur_cubit/surah_name_state.dart';
import 'package:quran_karem/constants/const.dart';
import 'package:quran_karem/data/model/surah_name_model.dart';
import 'package:quran_karem/data/repositories/repostory_imp.dart';

class SurahNamesCubit extends Cubit<SurahNameState>{
  Repository repository;

  SurahNamesCubit(this.repository) : super(SurahNamesInitial());

  NamesOfSurahModel? surahNamesModel;

 Future<Response?> getAllSurahNames()async{
    print('dfd');
    emit(SurahNamesLoadingState());
    return await repository.allNamesOfSurah().then((value) {
      surahNamesModel= surahNameModelFromJson(value.toString());
      print(surahNamesModel);
      emit(NamesOfSurahSuccessState(names: surahNamesModel!));
    }).catchError((exception){
      print( exception.toString());
      showToast(
          text: exception.toString(),
          gravity: ToastGravity.CENTER,
          tColor: ToastColors.ERROR
      );

      emit(NamesOfSurahErrorState(
        error: exception.toString()
      ));
    });
  }


}