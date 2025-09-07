import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/no_weather_body.dart';
import 'package:weather_app/screens/weather_body.dart';
import 'package:weather_app/services/weather_service.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weather app',
      debugShowCheckedModeBanner: false,
      home: NoWeatherBody(),
    );
  }
}
