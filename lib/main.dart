import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/constants/dark_them.dart';
import 'package:quran_karem/data/api_servers/dio_seirver.dart';
import 'package:quran_karem/data/api_servers/row_dio_server.dart';
import 'package:quran_karem/data/repositories/repostory_imp.dart';
import 'package:quran_karem/presentation/screens/all_drawer/drawer_screen.dart';
import 'package:quran_karem/presentation/screens/home_screen.dart';
import 'package:quran_karem/presentation/screens/list_and_details_surah/surah_names_screen.dart';

import 'bisness_logic/names_sur_cubit/surah_name_cubit.dart';
import 'data/api_servers/quran_server.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SurahNamesCubit(
          RepositoryImplementation(DioServer(), RowDioServer(), QuranServer()))
        ..getAllSurahNames(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: darkThem,
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
