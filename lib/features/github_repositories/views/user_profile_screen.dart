import 'package:bz/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/github_controller.dart';
import '../repositories/github_repository.dart';
import '../widgets/repo_item.dart';

class UserProfileScreen extends StatelessWidget {
  final String username;

  const UserProfileScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final controller = GithubController(GithubRepository());
        controller.fetchUserProfile(username); // call after creation
        return controller;
      },
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(username, style: AppTextStyle().h3),
          ),
          body: Consumer<GithubController>(
            builder: (context, controller, _) {
              if (controller.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.errorMessage != null) {
                return Center(child: Text(controller.errorMessage!));
              }

              final user = controller.userProfile;
              if (user == null) {
                return const Center(child: Text("No data"));
              }

              return Column(
                children: [
                  const SizedBox(height: 16),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.avatarUrl),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    user.login,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ListView.builder(
                        itemCount: controller.userRepos.length,
                        itemBuilder: (context, index) {
                          final repo = controller.userRepos[index];
                          return RepoItem(repo: repo);
                        },
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
