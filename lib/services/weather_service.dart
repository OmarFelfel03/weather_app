import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  Future<WeatherModel> getWeather() async {
    Response response = await dio.get(
      "https://api.weatherapi.com/v1/forecast.json?key=da0d2891b872464499b234551253008&q=London&days=1&aqi=no&alerts=no",
    );

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);

    print(weatherModel);

    return weatherModel;
  }
}
