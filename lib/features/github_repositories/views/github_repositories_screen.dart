import 'package:bz/features/github_repositories/views/user_profile_screen.dart';
import 'package:bz/features/github_repositories/widgets/repo_item.dart';
import 'package:bz/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/github_controller.dart';
import '../repositories/github_repository.dart';
import '../widgets/search_repo_field.dart';

class GithubRepositoriesScreen extends StatelessWidget {
  const GithubRepositoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GithubController(GithubRepository())..fetchRandomRepos(),
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text("GitHub Repos", style: AppTextStyle().h3),
          ),
          body: Consumer<GithubController>(
            builder: (context, controller, _) {
              TextEditingController searchController = TextEditingController();

              return RefreshIndicator(
                onRefresh: controller.fetchRandomRepos,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      SearchRepoField(
                        controller: searchController,
                        onSearch: () =>
                            controller.searchRepos(searchController.text),
                      ),
                      SizedBox(height: 10),
                      if (controller?.totalSearchCount != null &&
                          controller.totalSearchCount! > 0)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Text(
                            "${controller!.totalSearchCount} results",
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                      Expanded(
                        child: controller.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : controller.errorMessage != null
                            ? Center(child: Text(controller.errorMessage!))
                            : ListView.builder(
                                itemCount: controller.repos.length,
                                itemBuilder: (context, index) {
                                  final repo = controller.repos[index];
                                  return RepoItem(
                                    repo: repo,
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => UserProfileScreen(
                                          username: repo.owner!.login,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
