import 'package:bz/features/weather/controllers/weather_controller.dart';
import 'package:bz/features/weather/widgets/weather_details.dart';
import 'package:bz/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late final WeatherController controller;
  @override
  void initState() {
    controller = context.read<WeatherController>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchingWeather();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Weather", style: AppTextStyle().h3),
      ),
      body: const WeatherDetails(),
      floatingActionButton: Consumer<WeatherController>(
        builder: (context, controller, _) {
          return FloatingActionButton(
            onPressed: () {
              controller.setCurrentLocation(true);
            },
            child: Icon(
              controller.currentLocation
                  ? Icons.my_location
                  : Icons.location_disabled_outlined,
            ),
          );
        },
      ),
    );
  }
}
