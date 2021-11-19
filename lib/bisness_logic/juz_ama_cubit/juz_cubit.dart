import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran_karem/bisness_logic/juz_ama_cubit/juz_state.dart';
import 'package:quran_karem/constants/const.dart';
import 'package:quran_karem/data/model/juz_ama_model.dart';
import 'package:quran_karem/data/repositories/repostory_imp.dart';

class JuzCubit extends Cubit<JuzState> {
  Repository _repository;
  JuzCubit(this._repository) : super(JuzInitialState());
  DetailsOfJuzModel? detailsOfJuz;



  Future<Response?>getAllJuz({required int id}) async {
    emit(JuzLoadingState());
    return await _repository.allJuz(id: id).then((value) {
      detailsOfJuz = detailsOfJuzModelFromJson(value.toString());
      print(detailsOfJuz);
      emit(JuzSuccessState(detailsOfJuz: detailsOfJuz!));
    }).catchError((error) {
      print(error.toString());
      showToast(
        text: error.toString(),
        gravity: ToastGravity.CENTER,
        tColor: ToastColors.ERROR
      );
      emit(JuzErrorState(error: error.toString()));
    });
  }
}
