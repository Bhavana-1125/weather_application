import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_flutter/widgets/background.dart';

void main() {
  testWidgets('Background', (WidgetTester tester) async{
    const String xValue = '0.5';
    const String yValue = '0.5';
    const Color colorValue = Colors.blue;
    const double height = 100.0;
    const double width = 100.0;
    const BoxShape shape = BoxShape.rectangle;
    await tester.pumpWidget(
        const MaterialApp(
      home: BackgroundAlign(
        xvalue: xValue,
        yvalue: yValue,
        colorValue: colorValue,
        height: height,
        width: width,
        shape: shape,
      ),
    ));

    expect(find.byType(BackgroundAlign), findsOneWidget);
    // final alignFinder = find.byType(type)
    // final alignWidget = tester.widget(finder)
  });
}