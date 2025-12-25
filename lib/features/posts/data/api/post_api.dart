import 'package:bz/core/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// import '../../../core/network/api_client.dart';
import '../models/post.dart';
import '../models/user.dart';

part 'post_api.g.dart';

@RestApi()
abstract class PostApi extends ApiClient {
  factory PostApi(Dio dio, {String baseUrl}) = _PostApi;

  @GET("/posts")
  Future<List<Post>> getPosts();

  @GET("/users")
  Future<List<User>> getUsers();

  @GET("/users/{id}/posts")
  Future<List<Post>> getUserPosts(@Path("id") int userId);
}
