import 'package:bz/core/network/github/github_client.dart';
import 'package:bz/core/network/github/github_dio.dart';
import 'package:bz/features/github_repositories/data/models/search_response.dart';

void main() async {
  GithubClient client = GithubClient(GithubDio.create);

  // GithubRepository repository = GithubRepository();

  final SearchResponse res = await client.searchRepos("crudsPooJs");

  print(res.items[0].name);
  // print(res[0].description);
  // print(res[0].htmlUrl);
  // print(res[0].owner?.avatarUrl);
  // print(res[0].owner?.login);
  // print(res[0].stargazersCount);
  // print(res[0].forksCount);
}
