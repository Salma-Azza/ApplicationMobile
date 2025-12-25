import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/post_controller.dart';
import 'widgets/post_tile.dart';

class UserScreen extends StatefulWidget {
  final int userId;
  const UserScreen({super.key, required this.userId});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    final controller = Provider.of<PostController>(context, listen: false);
    controller.fetchUsers();
    controller.fetchUserPosts(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'User Info',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: false,
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      body: Consumer<PostController>(
        builder: (context, controller, child) {
          if (controller.loading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          }

          final user = controller.users.firstWhere(
            (u) => u.id == widget.userId,
            orElse: () => throw Exception('User not found'),
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '@${user.username}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Info rows with better spacing
                      _buildInfoRow('Email', user.email, Icons.email_outlined),
                      const SizedBox(height: 12),
                      _buildInfoRow('Phone', user.phone, Icons.phone_outlined),
                      const SizedBox(height: 12),
                      _buildInfoRow('Website', user.website, Icons.language),
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        'Company',
                        user.company.name,
                        Icons.business_outlined,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 28),

                // Posts section header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    'Posts',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                if (controller.userPosts.isEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32),
                    child: Center(
                      child: Text(
                        'No posts yet',
                        style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                      ),
                    ),
                  )
                else
                  ...controller.userPosts.map((post) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: PostTile(post: post, onTap: () {}),
                    );
                  }).toList(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: Colors.grey[600]),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
