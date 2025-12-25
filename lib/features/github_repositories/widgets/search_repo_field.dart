import 'package:flutter/material.dart';

class SearchRepoField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchRepoField({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search repository...',
        suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: onSearch),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
