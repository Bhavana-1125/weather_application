

import 'package:equatable/equatable.dart';

import '../models/weather/weather_data_model.dart';

abstract class WeatherBlocState extends Equatable {
  const WeatherBlocState();

  @override
  List<Object> get props => [];
}

class WeatherBlocInitial extends WeatherBlocState {}

class WeatherLoadingState extends WeatherBlocState {}

class WeatherSuccessState extends WeatherBlocState {
  final Temperatures weatherData;

  const WeatherSuccessState({required this.weatherData});

  @override
  List<Object> get props => [weatherData];
}

class WeatherFailureState extends WeatherBlocState {}
