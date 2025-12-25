import 'dart:async';

import 'package:bz/features/weather/controllers/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    final WeatherController controller = Provider.of<WeatherController>(
      context,
      listen: false,
    );
    _controller.text = controller.city ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherController>(
      builder: (context, controller, child) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: _controller,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.white),
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              suffixIcon: _controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.white),
                      onPressed: () {
                        _controller.clear();
                        setState(() {}); // refresh to hide the clear button
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),

              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onChanged: (value) {
              final String val = value.trim();

              if ((val.length ?? 0) >= 1) {
              } else {
                _controller.text = val;
                return;
              }
              if (_debounce?.isActive ?? false) _debounce!.cancel();
              _debounce = Timer(const Duration(milliseconds: 800), () {
                controller.searchWithCity(val);
              });
            },
          ),
        );
      },
    );
  }
}
