import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;

  WeatherService({required this.dio});

  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = 'YOUR API KEY';

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        "$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no",
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMsg =
          e.response?.data["error"]["message"] ?? 'oops something went wrong';
      throw Exception(errorMsg);
    } catch (e) {
      throw Exception();
    }
  }
}
