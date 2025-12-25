import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable()
class Repo {
  final String name;
  final String? description;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  final Owner? owner;

  @JsonKey(name: "stargazers_count", defaultValue: 0)
  final int stargazersCount;

  @JsonKey(name: "forks_count", defaultValue: 0)
  final int forksCount;

  Repo({
    required this.name,
    this.description,
    required this.htmlUrl,
    this.owner,
    this.stargazersCount = 0,
    this.forksCount = 0,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
  Map<String, dynamic> toJson() => _$RepoToJson(this);
}

@JsonSerializable()
class Owner {
  final String login;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  Owner({required this.login, required this.avatarUrl});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerToJson(this);
}
