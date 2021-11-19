import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran_karem/bisness_logic/detaild_sur_cubit/details_of_surah_state.dart';
import 'package:quran_karem/constants/const.dart';
import 'package:quran_karem/data/model/details_of_sur_model.dart';
import 'package:quran_karem/data/repositories/repostory_imp.dart';

class DetailsOfSurahCubit extends Cubit<DetailsOfSurahState> {
  Repository repositoryImp;
  DetailsOfSurahCubit(this.repositoryImp) : super(DetailsOfSurahInitial());

  DetailsOfSurahModel? detailsOfSurahModel;

Future<Response?>getDetailsOfSurah({required int id})async{
  emit(DetailsOfSurahLoadingState());
  return await repositoryImp.detailsOfSurah(id : id).then((value) {
    detailsOfSurahModel = detailsOfSurahModelFromJson(value.toString());
    print(detailsOfSurahModel);
    emit(DetailsOfSurahSuccessState(detailsOfSurahModel: detailsOfSurahModel));
  }).catchError((error){
    print('error : ${error.toString()}');
    showToast(
        text: error.toString(),
        gravity: ToastGravity.CENTER,
        tColor: ToastColors.ERROR
    );

    emit(DetailsOfSurahErrorState(error: error.toString()));

  });
}
}
