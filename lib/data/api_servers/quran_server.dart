import 'package:dio/dio.dart';
import 'package:quran_karem/constants/const.dart';
import 'package:quran_karem/constants/url.dart';

class QuranServer {
  Dio dio = Dio(BaseOptions(
    baseUrl: link,
    receiveDataWhenStatusError: true,
  )
    ,);

  Future<Response> getData({
    required String url,
  }) async {
    return await dio.get(url );
  }

}
