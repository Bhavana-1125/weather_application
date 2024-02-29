import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_flutter/bloc/weather_bloc_state.dart';
import 'package:weather_app_flutter/models/weather/weather_data_model.dart';

part 'weather_bloc_event.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeatherEvent>(fetchWeatherEvent);
  }

  FutureOr<void> fetchWeatherEvent(
      FetchWeatherEvent event, Emitter<WeatherBlocState> emit) async {
    try {
      emit(WeatherLoadingState());
      var client = http.Client();
      var response = await client.get(Uri.parse(
          'https://api.openweathermap.org/data/3.0/onecall?lat=40.77801343123564&lon=-74.07257487172888&appid=1052d49f73a085bb19189c8ec94d91f3&units=metric&exclude=minutely'));
      if (response.statusCode == 200) {
        final weatherData = Temperatures.fromJson(json.decode(response.body));
        emit(WeatherSuccessState(weatherData: weatherData));
      } else {
        emit(WeatherFailureState());
      }
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
