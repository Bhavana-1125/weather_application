import 'package:flutter/material.dart';

class BackgroundAlign extends StatelessWidget {
  final String xvalue;
  final String yvalue;
  final Color colorValue;
  final double height;
  final double width;
  final BoxShape shape;
  const BackgroundAlign(
      {Key? key,
      required this.xvalue,
      required this.yvalue,
      required this.colorValue,
      required this.height,
      required this.width,
      required this.shape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(double.parse(xvalue as String), double.parse(yvalue as String)),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: colorValue ?? Colors.transparent,
          shape: shape,

        ),
      ),
    );
  }
}
