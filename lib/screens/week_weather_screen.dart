import 'package:flutter/material.dart';

class WeekWeatherScreen extends StatelessWidget {
  const WeekWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weekly Weather Report',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: const Color(0xFF1565C0),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(35, 20, 35, 10),
        child: ListView.builder(
          //scrollDirection: Axis.horizontal,
          itemCount: 7, // Assuming we have data for 7 days
          itemBuilder: (context, index) {
            // Replace with actual data
            String day = 'Day $index';
            String iconPath = 'lib/assets/weather/01d.png';
            double temp = 25.0;
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 70,
                width: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFF283593),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        day,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      //SizedBox(height: 4),
                      Image.asset(
                        iconPath,
                        height: 50,
                      ),
                      // SizedBox(height: 4),
                      Text(
                        '${temp.toStringAsFixed(1)}°C',
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
    );
  }
}
