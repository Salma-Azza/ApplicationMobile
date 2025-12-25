import 'package:bz/features/chat_boot/data/models/rag_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'open_ai.g.dart';

@RestApi()
abstract class OpenAiClient {
  factory OpenAiClient(Dio dio, {String baseUrl}) = _OpenAiClient;

  @POST("/answer")
  Future<RagResponse> getAnswer();
}
