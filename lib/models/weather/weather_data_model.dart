import 'package:json_annotation/json_annotation.dart';

part 'weather_data_model.g.dart';

@JsonSerializable()
class Temperatures {
  @JsonKey(name: "lat")
  double lat;
  @JsonKey(name: "lon")
  double lon;
  @JsonKey(name: "timezone")
  String timezone;
  @JsonKey(name: "timezone_offset")
  int timezoneOffset;
  @JsonKey(name: "current")
  Current current;
  @JsonKey(name: "hourly")
  List<Current> hourly;
  @JsonKey(name: "daily")
  List<Daily> daily;

  Temperatures({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  factory Temperatures.fromJson(Map<String, dynamic> json) => _$TemperaturesFromJson(json);

  Map<String, dynamic> toJson() => _$TemperaturesToJson(this);
}

@JsonSerializable()
class Current {
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "sunrise")
  int? sunrise;
  @JsonKey(name: "sunset")
  int? sunset;
  @JsonKey(name: "temp")
  double temp;
  @JsonKey(name: "feels_like")
  double feelsLike;
  @JsonKey(name: "pressure")
  int pressure;
  @JsonKey(name: "humidity")
  int humidity;
  @JsonKey(name: "dew_point")
  double dewPoint;
  @JsonKey(name: "uvi")
  double uvi;
  @JsonKey(name: "clouds")
  int clouds;
  @JsonKey(name: "visibility")
  int visibility;
  @JsonKey(name: "wind_speed")
  double windSpeed;
  @JsonKey(name: "wind_deg")
  int windDeg;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "wind_gust")
  double? windGust;
  @JsonKey(name: "pop")
  double? pop;
  @JsonKey(name: "rain")
  Rain? rain;

  Current({
    required this.dt,
    this.sunrise,
    this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
    this.windGust,
    this.pop,
    this.rain,
  });

  factory Current.fromJson(Map<String, dynamic> json) => _$CurrentFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

@JsonSerializable()
class Rain {
  @JsonKey(name: "1h")
  double the1H;

  Rain({
    required this.the1H,
  });

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}

@JsonSerializable()
class Weather {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "main")
  Main main;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "icon")
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

enum Main {
  @JsonValue("Clear")
  clear,
  @JsonValue("Clouds")
  clouds,
  @JsonValue("Rain")
  rain,
  @JsonValue("Mist") // Add "Mist" as a supported value
  mist,
  @JsonValue("Drizzle") // Add "Mist" as a supported value
  drizzle,
}

@JsonSerializable()
class Daily {
  @JsonKey(name: "dt")
  int dt;
  @JsonKey(name: "sunrise")
  int sunrise;
  @JsonKey(name: "sunset")
  int sunset;
  @JsonKey(name: "moonrise")
  int moonrise;
  @JsonKey(name: "moonset")
  int moonset;
  @JsonKey(name: "moon_phase")
  double moonPhase;
  @JsonKey(name: "summary")
  String summary;
  @JsonKey(name: "temp")
  Temp temp;
  @JsonKey(name: "feels_like")
  FeelsLike feelsLike;
  @JsonKey(name: "pressure")
  int pressure;
  @JsonKey(name: "humidity")
  int humidity;
  @JsonKey(name: "dew_point")
  double dewPoint;
  @JsonKey(name: "wind_speed")
  double windSpeed;
  @JsonKey(name: "wind_deg")
  int windDeg;
  @JsonKey(name: "wind_gust")
  double windGust;
  @JsonKey(name: "weather")
  List<Weather> weather;
  @JsonKey(name: "clouds")
  int clouds;
  @JsonKey(name: "pop")
  double pop;
  @JsonKey(name: "uvi")
  double uvi;
  @JsonKey(name: "rain")
  double? rain;

  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.summary,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.uvi,
    this.rain,
  });

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}

@JsonSerializable()
class FeelsLike {
  @JsonKey(name: "day")
  double day;
  @JsonKey(name: "night")
  double night;
  @JsonKey(name: "eve")
  double eve;
  @JsonKey(name: "morn")
  double morn;

  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => _$FeelsLikeFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeToJson(this);
}

@JsonSerializable()
class Temp {
  @JsonKey(name: "day")
  double day;
  @JsonKey(name: "min")
  double min;
  @JsonKey(name: "max")
  double max;
  @JsonKey(name: "night")
  double night;
  @JsonKey(name: "eve")
  double eve;
  @JsonKey(name: "morn")
  double morn;

  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);

  Map<String, dynamic> toJson() => _$TempToJson(this);
}
