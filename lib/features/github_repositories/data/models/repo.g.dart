// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repo _$RepoFromJson(Map<String, dynamic> json) => Repo(
  name: json['name'] as String,
  description: json['description'] as String?,
  htmlUrl: json['html_url'] as String,
  owner: json['owner'] == null
      ? null
      : Owner.fromJson(json['owner'] as Map<String, dynamic>),
  stargazersCount: (json['stargazers_count'] as num?)?.toInt() ?? 0,
  forksCount: (json['forks_count'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$RepoToJson(Repo instance) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'html_url': instance.htmlUrl,
  'owner': instance.owner,
  'stargazers_count': instance.stargazersCount,
  'forks_count': instance.forksCount,
};

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
  login: json['login'] as String,
  avatarUrl: json['avatar_url'] as String,
);

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
  'login': instance.login,
  'avatar_url': instance.avatarUrl,
};
