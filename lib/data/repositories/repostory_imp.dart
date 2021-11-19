import 'package:dio/dio.dart';
import 'package:quran_karem/constants/end_points.dart';
import 'package:quran_karem/data/api_servers/dio_seirver.dart';
import 'package:quran_karem/data/api_servers/quran_server.dart';
import 'package:quran_karem/data/api_servers/row_dio_server.dart';

abstract class Repository {
  Future<Response<dynamic>> allNamesOfSurah();

  Future<Response<dynamic>> detailsOfSurah({required int id});

  Future<Response<dynamic>> allJuz({required int id});
  Future<Response<dynamic>> getAudioSurah();
  Future<Response<dynamic>> getAudioSurahDetails({required int id});


}

class RepositoryImplementation extends Repository {
  DioServer? _dioServer;
  RowDioServer? _rowDioServer;
  QuranServer? _quranServer;
  RepositoryImplementation(this._dioServer,this._rowDioServer,this._quranServer);

  @override
  Future<Response<dynamic>> allNamesOfSurah() async {
    return await _dioServer!.getData(url: Surah_Names_End_point);
  }

  @override
  Future<Response> detailsOfSurah({required int id}) async {
    return await _dioServer!.getData(url: '$Surah_Details_End_point$id');
  }

  @override
  Future<Response> allJuz({required int id}) async {
    return await _dioServer!.getData(url: '$Juz_End_point$id');
  }

  @override
  Future<Response> getAudioSurah() async{
    return await _rowDioServer!.getData(url: Audio_Surah_List_End_point);
  }



  @override
  Future<Response> getAudioSurahDetails({required int id})async {
    return await _quranServer!.getData(url:'$Audio_Surah_Details_End_point/$id$Audio_Surah_num_End_point');

    }
}
