import 'package:bz/core/network/github/github_client.dart';
import 'package:bz/core/network/github/github_dio.dart';
import 'package:bz/features/github_repositories/data/models/repo.dart';
import 'package:bz/features/github_repositories/data/models/search_response.dart';
import 'package:bz/features/github_repositories/data/models/user.dart';

class GithubRepository {
  final GithubClient client = GithubClient(GithubDio.create);

  Future<List<Repo>> getRandomRepos() async => client.getRandomRepos();

  /// Search GitHub repositories
  Future<SearchResponse> searchRepos(String query) async {
    final SearchResponse result = await client.searchRepos(
      query,
    ); // returns SearchResult
    return result;
  }

  Future<List<Repo>> getUserRepos(String username) async =>
      client.getUserRepos(username);

  Future<User> getUser(String username) async => client.getUser(username);
}
