
import 'package:quran_karem/data/model/details_of_sur_model.dart';

abstract class DetailsOfSurahState {}

class DetailsOfSurahInitial extends DetailsOfSurahState {}
class DetailsOfSurahLoadingState extends DetailsOfSurahState {}
class DetailsOfSurahSuccessState extends DetailsOfSurahState {
 final DetailsOfSurahModel? detailsOfSurahModel;

 DetailsOfSurahSuccessState({required this.detailsOfSurahModel});
}
class DetailsOfSurahErrorState extends DetailsOfSurahState {
  final String? error;

  DetailsOfSurahErrorState({required this.error});
}
