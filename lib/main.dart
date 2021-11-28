import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/bisness_logic/names_sur_cubit/surah_name_state.dart';
import 'package:quran_karem/constants/dark_them.dart';
import 'package:quran_karem/di.dart';
import 'package:quran_karem/presentation/raout_app.dart';
import 'package:quran_karem/presentation/screens/home_screen.dart';

import 'bisness_logic/names_sur_cubit/surah_name_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: darkThem,
      routes: Routes().routes,
      home: BlocProvider(
        create: (context) => nameSurahRep,
        child: BlocBuilder<SurahNamesCubit, SurahNameState>(
          builder: (context, state) {
            return Scaffold(
                body: HomeScreen()
            );
          },
        ),
      ),
    );
  }
}
