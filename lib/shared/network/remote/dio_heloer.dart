import 'package:alahdan_times/shared/network/remote/end_point.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static inIt() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiContext.BASE_URL,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic> queries,
  }) async {
    return await dio!.get(
      url,
      queryParameters: queries,
    );
  }
}
