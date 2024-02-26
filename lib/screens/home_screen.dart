import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:weather_app_flutter/bloc/weather_bloc_bloc.dart';
import 'package:weather_app_flutter/widgets/background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.search),
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                '${state.weather.areaName}',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    // Fetch the current position
                    Position position = await Geolocator.getCurrentPosition();
                    // Dispatch the FetchWeather event with the current position
                    BlocProvider.of<WeatherBlocBloc>(context)
                        .add(FetchWeather(position));
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ],
            ),
            //backgroundColor: Color(0xFF4FC3F7),
            backgroundColor: Color(0xFF3F51B5),
            body: Padding(
              padding: EdgeInsets.fromLTRB(35, 0, 35, 10),
              //padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 20, 10),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    //0xFF1565C0
                    const BackgroundAlign(
                      xvalue: '3',
                      yvalue: '-0.3',
                      colorValue: Color(0xFF1565C0),
                      //colorValue: Color(0xFFFFC400),
                      height: 400,
                      width: 500,
                      shape: BoxShape.circle,
                    ),
                    const BackgroundAlign(
                      xvalue: '-3',
                      yvalue: '-0.3',
                      colorValue: Color(0xFF1565C0),
                      //colorValue: Color(0xFFFFC400),
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
                    // BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                    //   builder: (context, state) {

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
                            '${state.weather.temperature!.celsius!.round()}°C',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '${state.weather.weatherMain!.toUpperCase()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          // Text(
                          //   'Thursday 22 | 09:45am',
                          //   style: TextStyle(
                          //       fontSize: 15,
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.w300),
                          // ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 120,
                            width: 350,
                            decoration: BoxDecoration(
                              color: Color(0xFF283593),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            //color: Color(0xFFE1F5FE),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 18.0, left: 8),
                                  child: Column(
                                    children: [
                                      const Image(
                                          height: 40,
                                          image: AssetImage(
                                              'lib/assets/icons/umbrella3.png')),
                                      Text(
                                        '${state.weather.pressure}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        'Pressure',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 18.0),
                                  child: Column(
                                    children: [
                                      const Image(
                                        height: 40,
                                        image: AssetImage(
                                            'lib/assets/icons/waterdrop.png'),
                                      ),
                                      Text(
                                        '${state.weather.humidity}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const Text(
                                        'Humidity',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 18.0, right: 8),
                                  child: Column(
                                    children: [
                                      const Image(
                                          height: 40,
                                          image: AssetImage(
                                              'lib/assets/icons/windspeed.png')),
                                      Text(
                                        '${state.weather.windSpeed}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      const Text(
                                        'Wind Speed',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Today',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17),
                              ),
                              Text(
                                '7-day Forecast',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 120,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF283593),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '10AM',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Icon(
                                          Icons.cloud,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '25°',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Container(
                                  height: 120,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF283593),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '12AM',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Icon(
                                          Icons.cloud,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '28°',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Container(
                                  height: 120,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF283593),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '10AM',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Icon(
                                          Icons.cloud,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '15°',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Container(
                                  height: 120,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF283593),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '11AM',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Icon(
                                          Icons.cloud,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '14°',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Container(
                                  height: 120,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF283593),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          '12PM',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Icon(
                                          Icons.cloud,
                                          size: 32,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          '12°',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                              ],
                            ),
                          )
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
