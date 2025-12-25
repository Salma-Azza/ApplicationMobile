import 'package:bz/features/chat_boot/views/chat_boot_screen.dart';
import 'package:bz/features/contact/views/contact_screen.dart';
import 'package:bz/features/github_repositories/views/github_repositories_screen.dart';
import 'package:bz/features/home/views/widgets/drawer_item.dart';
import 'package:bz/features/posts/views/posts_screen.dart';
import 'package:bz/features/weather/views/weather_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.contacts, 'title': 'Contact', 'widget': ContactScreen()},
    {'icon': Icons.message, 'title': 'Posts', 'widget': PostsScreen()},
    {
      'icon': Icons.code,
      'title': 'Github repositories',
      'widget': GithubRepositoriesScreen(),
    },
    {'icon': Icons.air_outlined, 'title': 'Weather', 'widget': WeatherScreen()},
    {
      'icon': Icons.chat_bubble_outline_outlined,
      'title': 'Chat Boot',
      'widget': ChatBootScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ======== Drawer Header ========
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey.shade100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/profile-image.jpg',
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            // ======== Drawer Items (Scrollable) ========
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, idx) {
                    return DrawerItem(
                      icon: items[idx]['icon'],
                      title: items[idx]['title'],
                      widget: items[idx]['widget'],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
