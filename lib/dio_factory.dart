import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String contentType = "content-type";
const String applicationJson = "application/json";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  Dio getDio() {
    Dio dio = Dio();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization:
          "key=AAAAPkaYMT0:APA91bFibvRpqPZy7dvWwl2efmV3ESoxd-XiMckRkA_yaVE2F_R1q65_VyG--D8AVLTFIbAztpO4bzoLP64xQskrfim1hqEghGFSHrAAqk1YysFpU2Cyg11cbZSqTj5DD-MoO-9OScAI",
    };
    dio.options = BaseOptions(
      baseUrl: "",
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      headers: headers,
    );

    return dio;
  }
}
