import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/bisness_logic/all_audio_cubit/all_audio_cubit.dart';
import 'package:quran_karem/bisness_logic/audio_detail_cubit/audio_details_cubit.dart';
import 'package:quran_karem/bisness_logic/detaild_sur_cubit/details_of_surah_cubit.dart';
import 'package:quran_karem/bisness_logic/juz_ama_cubit/juz_cubit.dart';
import 'package:quran_karem/bisness_logic/names_sur_cubit/surah_name_cubit.dart';
import 'package:quran_karem/data/api_servers/dio_seirver.dart';
import 'package:quran_karem/data/api_servers/quran_server.dart';
import 'package:quran_karem/data/api_servers/row_dio_server.dart';
import 'package:quran_karem/data/repositories/repostory_imp.dart';

// SurahNamesCubit namesCubit(context) => BlocProvider.of(context);
// DetailsOfSurahCubit detailsOfSurahCubit(context) => BlocProvider.of(context);
// JuzCubit juzCubit(context) => BlocProvider.of(context);
// AudioDetailsCubit audioDetailsCubit(context) => BlocProvider.of(context);
// AudioSurahCubit audioSurahCubit(context) => BlocProvider.of(context);
Repository repository = RepositoryImplementation(DioServer(), RowDioServer(), QuranServer());

AudioSurahCubit audioSurahRep =AudioSurahCubit(repository);
AudioDetailsCubit audioDetailsRep =AudioDetailsCubit(repository);
JuzCubit juzCubitRep =JuzCubit(repository);
SurahNamesCubit nameSurahRep= SurahNamesCubit(repository);
DetailsOfSurahCubit detailsOfSurahRep=DetailsOfSurahCubit(repository);