
import 'package:quran_karem/data/model/surah_name_model.dart';

abstract class SurahNameState{}
class SurahNamesInitial extends SurahNameState{}
class SurahNamesLoadingState extends SurahNameState{}
class NamesOfSurahSuccessState extends SurahNameState{
 final NamesOfSurahModel names;

  NamesOfSurahSuccessState({required this.names});
}
class NamesOfSurahErrorState extends SurahNameState{
  final String error;

  NamesOfSurahErrorState({required this.error});

}
