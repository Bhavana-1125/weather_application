import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_flutter/bloc/weather_bloc_bloc.dart';
import 'package:weather_app_flutter/bloc/weather_bloc_state.dart';
import 'package:weather_app_flutter/screens/week_weather_screen.dart';
import 'package:weather_app_flutter/widgets/additional_info.dart';
import 'package:weather_app_flutter/widgets/background.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherBlocBloc weatherBlocBloc = WeatherBlocBloc();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    weatherBlocBloc.add(FetchWeatherEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      bloc: weatherBlocBloc,
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is WeatherSuccessState) {
          final weatherData = state.weatherData;

          return Scaffold(
            appBar: AppBar(
              leading: const Icon(Icons.search),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                weatherData.timezone.split('/').last.replaceAll('_', ' '),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            backgroundColor: const Color(0xFF3F51B5),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(35, 0, 35, 10),
              //padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 20, 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    const BackgroundAlign(
                      xvalue: '3',
                      yvalue: '-0.3',
                      colorValue: Color(0xFF1565C0),
                      height: 400,
                      width: 500,
                      shape: BoxShape.circle,
                    ),
                    const BackgroundAlign(
                      xvalue: '-3',
                      yvalue: '-0.3',
                      colorValue: Color(0xFF1565C0),
                      height: 400,
                      width: 500,
                      shape: BoxShape.circle,
                    ),
                    const BackgroundAlign(
                      xvalue: '0',
                      yvalue: '-1.2',
                      //colorValue: Color(0xFF3F51B5),
                      colorValue: Color(0xFF4FC3F7),
                      height: 400,
                      width: 600,
                      shape: BoxShape.rectangle,
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                      child: Container(
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Image(
                            image: AssetImage('lib/assets/images/1.png'),
                            height: 200,
                          ),
                          Text(
                            '${weatherData.current.temp}°C',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            weatherData.current.weather[0].description,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                              height: 120,
                              width: 350,
                              decoration: BoxDecoration(
                                color: const Color(0xFF283593),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AdditionalInfoItem(
                                      weatherIcon:
                                          'lib/assets/icons/umbrella3.png',
                                      label: 'pressure',
                                      value: weatherData.current.pressure),
                                  AdditionalInfoItem(
                                      weatherIcon:
                                          'lib/assets/icons/waterdrop.png',
                                      label: 'Humidity',
                                      value: weatherData.current.humidity),
                                  AdditionalInfoItem(
                                      weatherIcon:
                                          'lib/assets/icons/windspeed.png',
                                      label: 'Wind speed',
                                      value:
                                          weatherData.current.windSpeed.toInt())
                                  //             style: const TextStyle( )
                                ],
                              )),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Today',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const WeekWeatherScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  '7-day Forecast',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: weatherData.hourly.length > 12
                                  ? 12
                                  : weatherData.hourly.length,
                              itemBuilder: (context, index) {
                                final hourData = weatherData.hourly[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    // height: 100,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF283593),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        //crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${DateTime.fromMillisecondsSinceEpoch(hourData.dt * 1000).hour}AM',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Image.asset(
                                              "lib/assets/weather/${weatherData.hourly[index].weather[0].icon}.png",
                                              height: 50),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            '${hourData.temp.toStringAsFixed(1)}°C',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
