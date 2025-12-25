import 'package:dio/dio.dart';

class GithubDio {
  static final Dio create = Dio(
    BaseOptions(
      baseUrl: "https://api.github.com",
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );
}
