part of 'weather_bloc_bloc.dart';

sealed class WeatherBlocEvent extends Equatable {
const WeatherBlocEvent();
@override
List<Object> get props => [];
}


final class FetchWeatherEvent extends WeatherBlocEvent{

}



//
// part of 'demo_bloc_bloc.dart';
//
// sealed class DemoBlocEvent extends Equatable {
// const DemoBlocEvent();
//
// @override
// List<Object> get props => [];
// }
//
// class FetchWeatherEvent extends DemoBlocEvent{
// final String cityName; // Define cityName parameter
//
// FetchWeatherEvent({required this.cityName}); // Constructor with cityName parameter
// }