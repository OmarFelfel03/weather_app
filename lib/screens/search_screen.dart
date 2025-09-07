import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController myController = TextEditingController();
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Search city")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: TextField(
            controller: myController,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 24,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              labelText: "Search",
              hintText: "Enter city",
              suffixIcon: IconButton(
                onPressed: () async {
                  var getWeatherData = BlocProvider.of<GetWeatherCubit>(
                    context,
                  );
                  getWeatherData.getWeather(cityName: myController.text);
                  Navigator.pop(context);
                },
                icon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
