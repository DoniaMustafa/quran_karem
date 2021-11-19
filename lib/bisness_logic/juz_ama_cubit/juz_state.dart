
import 'package:quran_karem/data/model/juz_ama_model.dart';

abstract class JuzState{}
class JuzInitialState extends JuzState{}
class JuzLoadingState extends JuzState{}
class JuzSuccessState extends JuzState{
  final DetailsOfJuzModel detailsOfJuz;

  JuzSuccessState({required this.detailsOfJuz});
}
class JuzErrorState extends JuzState{
  final String error;

  JuzErrorState({required this.error});
}