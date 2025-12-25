import 'package:bz/features/home/views/widgets/app_drawer.dart';
import 'package:bz/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home", style: AppTextStyle().h2)),
      drawer: AppDrawer(),
      body: SafeArea(
        child: Center(
          child: Text(
            "Welcome To Bilal Zouine App",
            style: AppTextStyle().bodyLarge,
          ),
        ),
      ),
    );
  }
}
