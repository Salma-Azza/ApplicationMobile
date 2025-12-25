import 'package:flutter/material.dart';

import '../data/models/post.dart';
import '../data/models/user.dart';
import '../data/repository/post_repository.dart';

class PostController extends ChangeNotifier {
  final PostRepository repository;

  PostController(this.repository);

  List<Post> posts = [];
  List<User> users = [];
  List<Post> userPosts = [];
  bool loading = false;

  Future<void> fetchPosts() async {
    try {
      loading = true;
      notifyListeners();
      posts = await repository.fetchPosts();
      loading = false;
      notifyListeners();
    } catch (err) {}

    loading = false;
    notifyListeners();
  }

  Future<void> fetchUsers() async {
    loading = true;
    notifyListeners();
    users = await repository.fetchUsers();
    loading = false;
    notifyListeners();
  }

  Future<void> fetchUserPosts(int userId) async {
    loading = true;
    notifyListeners();
    userPosts = await repository.fetchUserPosts(userId);
    loading = false;
    notifyListeners();
  }
}
