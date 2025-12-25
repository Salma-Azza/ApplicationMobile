import 'package:bz/features/chat_boot/data/models/rag_request.dart';
import 'package:bz/features/chat_boot/data/models/rag_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/network/api_client.dart';

part 'rag_response_api.g.dart';

@RestApi()
abstract class RagResponseApi extends ApiClient {
  factory RagResponseApi(Dio dio, {String baseUrl}) = _RagResponseApi;

  @POST("/answer")
  Future<RagResponse> getAnswer(@Body() RagRequest ragRequest);
}
