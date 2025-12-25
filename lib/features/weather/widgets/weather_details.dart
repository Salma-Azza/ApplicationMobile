import 'package:bz/features/weather/widgets/search_field.dart';
import 'package:bz/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/weather_controller.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<WeatherController>();

    return RefreshIndicator(
      onRefresh: () => controller.fetchingWeather(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Container(
                // color: Colors.blueAccent,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/sky.jpg"),
                    fit: BoxFit.cover,
                    opacity: 1,
                  ),
                ),

                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    const SearchField(),
                    const SizedBox(height: 20),
                    _buildContent(controller, context),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildContent(WeatherController controller, BuildContext context) {
    // Loading
    if (controller.isLoading) {
      return SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    // Error
    if (controller.errorMessage != null) {
      return _buildErrorUI(controller, context);
    }

    // No data
    if (controller.weather == null) {
      return _buildEmptyUI(context);
    }

    // Weather exists
    final weather = controller.weather!;

    return Column(
      children: [
        // Weather icon
        Center(
          child: CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
              "https://openweathermap.org/img/wn/${weather.icon}@2x.png",
            ),
            backgroundColor: Colors.transparent,
          ),
        ),

        const SizedBox(height: 10),

        // Temperature
        Text(
          "${weather.temp.toInt()}°",
          style: AppTextStyle.withColor(AppTextStyle().h1, Colors.white),
        ),

        const SizedBox(height: 10),

        // City name + location icon centered cleanly
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_outlined,
              color: Colors.black45,
              size: 30,
            ),
            Flexible(
              child: Text(
                weather.name,
                style: AppTextStyle.withColor(
                  AppTextStyle().h1,
                  Colors.black.withOpacity(0.4),
                ),
                overflow: TextOverflow.fade,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Description
        Text(
          weather.description,
          style: AppTextStyle.withColor(
            AppTextStyle().h2,
            Colors.black.withOpacity(0.5),
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 20),

        // Max & Min
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Min: ${weather.tempMin.toInt()}°",
              style: AppTextStyle.withColor(
                AppTextStyle().h3,
                Colors.black.withOpacity(0.6),
              ),
            ),

            const SizedBox(width: 20),

            Text(
              "Max: ${weather.tempMax.toInt()}°",
              style: AppTextStyle.withColor(
                AppTextStyle().h3,
                Colors.black.withOpacity(0.6),
              ),
            ),
          ],
        ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildErrorUI(WeatherController controller, BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 70),
            const SizedBox(height: 12),
            Text(
              controller.errorMessage!,
              style: AppTextStyle.withColor(AppTextStyle().h2, Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.fetchingWeather(),
              child: Text("Retry", style: AppTextStyle().h3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyUI(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.7,
      child: Center(
        child: Text(
          "No data available",
          style: AppTextStyle.withColor(AppTextStyle().h2, Colors.white),
        ),
      ),
    );
  }
}
