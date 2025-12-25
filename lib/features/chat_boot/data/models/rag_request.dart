import 'package:json_annotation/json_annotation.dart';

part 'rag_request.g.dart';

@JsonSerializable()
class RagRequest {
  final String question;

  RagRequest({required this.question});

  Map<String, dynamic> toJson() => _$RagRequestToJson(this);
}
