import 'package:dio/dio.dart';

import '../api/post_api.dart';
import '../models/post.dart';
import '../models/user.dart';

class PostRepository {
  final PostApi _api;

  PostRepository(Dio dio) : _api = PostApi(dio);

  Future<List<Post>> fetchPosts() => _api.getPosts();
  Future<List<User>> fetchUsers() => _api.getUsers();
  Future<List<Post>> fetchUserPosts(int userId) => _api.getUserPosts(userId);
}
