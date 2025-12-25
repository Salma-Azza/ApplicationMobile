import 'package:bz/features/github_repositories/data/models/repo.dart';
import 'package:bz/features/github_repositories/data/models/search_response.dart';
import 'package:bz/features/github_repositories/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'github_client.g.dart';

@RestApi()
abstract class GithubClient {
  factory GithubClient(Dio dio, {String baseUrl}) = _GithubClient;

  @GET("/repositories")
  Future<List<Repo>> getRandomRepos();

  @GET("/search/repositories")
  Future<SearchResponse> searchRepos(@Query("q") String query);

  @GET("/users/{username}/repos")
  Future<List<Repo>> getUserRepos(@Path("username") String username);

  @GET("/users/{username}")
  Future<User> getUser(@Path("username") String username);
}
