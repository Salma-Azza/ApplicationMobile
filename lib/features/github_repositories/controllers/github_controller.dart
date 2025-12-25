import 'package:bz/features/github_repositories/data/models/search_response.dart';
import 'package:flutter/material.dart';

import '../data/models/repo.dart';
import '../data/models/user.dart';
import '../repositories/github_repository.dart';

class GithubController extends ChangeNotifier {
  final GithubRepository repository;

  GithubController(this.repository);

  List<Repo> repos = [];
  bool isLoading = false;
  String? errorMessage;
  int? totalSearchCount;
  User? userProfile;
  List<Repo> userRepos = [];

  // Random / initial repos
  Future<void> fetchRandomRepos() async {
    isLoading = true;
    totalSearchCount = 0;
    notifyListeners();
    try {
      repos = await repository.getRandomRepos();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  // Search any repo
  Future<void> searchRepos(String query) async {
    isLoading = true;
    notifyListeners();
    try {
      final SearchResponse result = await repository.searchRepos(query);

      repos = result.items;

      totalSearchCount = result.totalCount;

      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }

  // Get owner profile + repos
  Future<void> fetchUserProfile(String username) async {
    isLoading = true;
    notifyListeners();
    try {
      userProfile = await repository.getUser(username);
      userRepos = await repository.getUserRepos(username);
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
