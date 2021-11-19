import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_karem/bisness_logic/all_audio_cubit/all_audio_cubit.dart';
import 'package:quran_karem/bisness_logic/audio_detail_cubit/audio_details_cubit.dart';
import 'package:quran_karem/bisness_logic/detaild_sur_cubit/details_of_surah_cubit.dart';
import 'package:quran_karem/bisness_logic/juz_ama_cubit/juz_cubit.dart';
import 'package:quran_karem/bisness_logic/names_sur_cubit/surah_name_cubit.dart';
import 'package:quran_karem/data/api_servers/dio_seirver.dart';
import 'package:quran_karem/data/api_servers/quran_server.dart';
import 'package:quran_karem/data/api_servers/row_dio_server.dart';
import 'package:quran_karem/data/model/reader_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quran_karem/data/repositories/repostory_imp.dart';




List<String> numbersOfJuz = [
  'الجزء الاول',
  'الجزء الثاني',
  'الجزء الثالث',
  'الجزء الرابع',
  'الجزء الخامس',
  'الجزء السادس',
  'الجزء السابع',
  'الجزء الثامن',
  'الجزء التاسع',
  'الجزء العاشر',
  'الجزء الحادي عشر',
  'الجزء الثاني عشر',
  'الجزء الثالث عشر',
  'الجزء الرابع عشر',
  'الجزء الخامس عشر',
  'الجزء السادس عشر',
  'الجزء السابع عشر',
  'الجزء الثامن عشر',
  'الجزء التاسع عشر',
  'الجزء العشرين',
  'الجزء الواحد والعشرين',
  'الجزء الثاني والعشرين',
  'الجزء الثالث والعشرين',
  'الجزء الرابع والعشرين',
  'الجزء الخامس والعشرين',
  'الجزء السادس والعشرين',
  'الجزء السابع والعشرين',
  'الجزء الثامن والعشرين',
  'الجزء التاسع والعشرين',
  'الجزء الثلاثون',
];

List<ReaderModel> recitationName = [
  ReaderModel(id: 'mishaari_raashid_al_3afaasee', readersName: 'مشاري العفاسي'),
  ReaderModel(id: 'abdurrahmaan_as-sudays', readersName: 'عبدالرحمن السديسي'),
  ReaderModel(id: 'sa3d_al-ghaamidi', readersName: 'سعد الغامدي'),

];


showToast({required String text, required ToastColors tColor,
  required ToastGravity gravity
}) {
  Fluttertoast.showToast(
      msg: '$text',
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 16,
      backgroundColor: setToastColor(tColor),

      gravity:gravity
  );
}


enum ToastColors { SUCCESS, ERROR, WARNING }

setToastColor(ToastColors color) {
  Color basicColor;
  switch (color) {
    case ToastColors.SUCCESS:
      basicColor = Colors.green;
      break;
    case ToastColors.ERROR:
      basicColor = Colors.red;
      break;
    case ToastColors.WARNING:
      basicColor = Colors.yellow;

      break;
  }
  return basicColor;
}