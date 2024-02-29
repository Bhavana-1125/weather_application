import 'package:flutter/material.dart';


class AdditionalInfoItem extends StatelessWidget {
  final String weatherIcon;
  final String label;
  final int value;

  const AdditionalInfoItem(
      {Key? key, required this.weatherIcon, required this.label, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
       const EdgeInsets.only(top: 18.0, left: 8, right: 8),
     // const EdgeInsets.all(9.0),
      child: Column(
        children: [
          Image(
            height: 40,
            image: AssetImage(
                weatherIcon),
          ),
          Text(
            '$value',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}