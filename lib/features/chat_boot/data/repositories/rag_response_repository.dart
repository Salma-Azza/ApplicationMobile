import 'package:bz/features/chat_boot/data/api/rag_response_api.dart';
import 'package:bz/features/chat_boot/data/models/rag_response.dart';
import 'package:dio/dio.dart';

class RagResponseRepository {
  late final RagResponseApi _api;

  RagResponseRepository(Dio dio) : _api = RagResponseApi(dio);

  Future<RagResponse> getAnswer(question) => _api.getAnswer(question);
}
