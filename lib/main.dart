import 'package:bz/core/network/dio_client.dart';
import 'package:bz/core/network/openAi/open_ai_dio.dart';
import 'package:bz/features/chat_boot/controllers/chat_controller.dart';
import 'package:bz/features/chat_boot/data/repositories/rag_response_repository.dart';
import 'package:bz/features/home/views/home_screen.dart';
import 'package:bz/features/posts/controllers/post_controller.dart';
import 'package:bz/features/posts/data/repository/post_repository.dart';
import 'package:bz/features/weather/controllers/weather_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PostController(PostRepository(DioClient.create())),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              ChatController(RagResponseRepository(OpenAiDio.create())),
        ),
        ChangeNotifierProvider(create: (_) => WeatherController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const HomeScreen());
  }
}
