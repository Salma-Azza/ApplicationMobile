import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/repo.dart';
import '../models/user.dart';

class GithubApi {
  final String baseUrl = "https://api.github.com";

  Future<List<Repo>> getRandomRepos() async {
    final response = await http.get(Uri.parse('$baseUrl/repositories'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Repo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load repositories');
    }
  }

  Future<List<Repo>> searchRepos(String query) async {
    final response = await http.get(
      Uri.parse('$baseUrl/search/repositories?q=$query'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List items = data['items'];
      return items.map((json) => Repo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search repositories');
    }
  }

  Future<List<Repo>> getUserRepos(String username) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$username/repos'),
    );
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Repo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load user repositories');
    }
  }

  Future<User> getUser(String username) async {
    final response = await http.get(Uri.parse('$baseUrl/users/$username'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }
}
