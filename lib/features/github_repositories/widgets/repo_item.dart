import 'package:flutter/material.dart';

import '../data/models/repo.dart';

class RepoItem extends StatelessWidget {
  final Repo repo;
  final VoidCallback? onTap;

  const RepoItem({super.key, required this.repo, this.onTap});

  @override
  Widget build(BuildContext context) {
    final ownerAvatar = repo.owner?.avatarUrl.isNotEmpty == true
        ? NetworkImage(repo.owner!.avatarUrl)
        : NetworkImage('https://github.com/${repo.owner!.login}.png');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: ownerAvatar,
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      repo.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      repo.description?.isNotEmpty == true
                          ? repo.description!
                          : "No description",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.yellow[700]),
                        const SizedBox(width: 4),
                        Text(
                          repo.stargazersCount.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        const SizedBox(width: 12),
                        Icon(
                          Icons.call_split,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          repo.forksCount.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      repo.owner!.login,
                      style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
