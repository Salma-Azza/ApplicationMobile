import 'package:bz/features/github_repositories/data/models/repo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: "total_count")
  final int totalCount;

  @JsonKey(name: "incomplete_results")
  final bool incompleteResults;

  final List<Repo> items;

  SearchResponse({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
